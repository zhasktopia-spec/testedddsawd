
export default function handler(req, res) {
    const userAgent = req.headers['user-agent'] || '';
    
  
    const isBrowser = userAgent.includes('Mozilla') || 
                      userAgent.includes('Chrome') || 
                      userAgent.includes('Safari') ||
                      userAgent.includes('Edg') ||
                      userAgent.includes('Firefox');
    
    if (isBrowser) {
    
        res.setHeader('Content-Type', 'text/html');
        res.status(200).send(`
            <!DOCTYPE html>
            <html>
            <head>
                <title>403 Forbidden</title>
                <style>
                    body {
                        background: #0a0a0a;
                        color: #ff4444;
                        font-family: monospace;
                        text-align: center;
                        padding-top: 100px;
                    }
                    h1 { font-size: 48px; }
                    p { color: #666; }
                </style>
            </head>
            <body>
                <h1>⛔ ACCESS DENIED</h1>
                <p>This content cannot be accessed directly via browser.</p>
                <p style="font-size:12px;">Use Roblox executor to load this script.</p>
            </body>
            </html>
        `);
    } else {
      
        const fs = require('fs');
        const path = require('path');
        const scriptPath = path.join(process.cwd(), 'api', 'rawrr.lua');
        const script = fs.readFileSync(scriptPath, 'utf8');
        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        res.status(200).send(script);
    }
}
