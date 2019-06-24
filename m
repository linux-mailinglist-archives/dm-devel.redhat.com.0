Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E6505AB
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74A8B3082E8E;
	Mon, 24 Jun 2019 09:30:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D0F608E4;
	Mon, 24 Jun 2019 09:30:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D34D206D3;
	Mon, 24 Jun 2019 09:29:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9T8Xo004742 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A13E95C5FD; Mon, 24 Jun 2019 09:29:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 741125C64A;
	Mon, 24 Jun 2019 09:29:08 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E452EA705;
	Mon, 24 Jun 2019 09:29:00 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:53 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:33 +0200
Message-Id: <20190624092756.7769-9-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 24 Jun 2019 09:29:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 24 Jun 2019 09:29:01 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 07/30] libmultipath/libmpathcmd: use target
	length for unix socket sun_path
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 24 Jun 2019 09:30:15 +0000 (UTC)

Note that sun_path doesn't necessarily need to be 0-terminated for an abstract
socket name for ux_socket_listen(), this means we need to use memcpy to avoid
a spurious warning.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathcmd/mpath_cmd.c | 4 +++-
 libmultipath/uxsock.c   | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/libmpathcmd/mpath_cmd.c b/libmpathcmd/mpath_cmd.c
index b681311b..f00bf7e1 100644
--- a/libmpathcmd/mpath_cmd.c
+++ b/libmpathcmd/mpath_cmd.c
@@ -103,8 +103,10 @@ int __mpath_connect(int nonblocking)
 	memset(&addr, 0, sizeof(addr));
 	addr.sun_family = AF_LOCAL;
 	addr.sun_path[0] = '\0';
+	strncpy(&addr.sun_path[1], DEFAULT_SOCKET, sizeof(addr.sun_path) - 1);
 	len = strlen(DEFAULT_SOCKET) + 1 + sizeof(sa_family_t);
-	strncpy(&addr.sun_path[1], DEFAULT_SOCKET, len);
+	if (len > sizeof(struct sockaddr_un))
+		len = sizeof(struct sockaddr_un);
 
 	fd = socket(AF_LOCAL, SOCK_STREAM, 0);
 	if (fd == -1)
diff --git a/libmultipath/uxsock.c b/libmultipath/uxsock.c
index 7e5a1449..9b4e9784 100644
--- a/libmultipath/uxsock.c
+++ b/libmultipath/uxsock.c
@@ -66,9 +66,12 @@ int ux_socket_listen(const char *name)
 	memset(&addr, 0, sizeof(addr));
 	addr.sun_family = AF_LOCAL;
 	addr.sun_path[0] = '\0';
-	len = strlen(name) + 1 + sizeof(sa_family_t);
-	strncpy(&addr.sun_path[1], name, len);
+	len = strlen(name) + 1;
+	if (len >= sizeof(addr.sun_path))
+		len = sizeof(addr.sun_path) - 1;
+	memcpy(&addr.sun_path[1], name, len);
 
+	len += sizeof(sa_family_t);
 	if (bind(fd, (struct sockaddr *)&addr, len) == -1) {
 		condlog(3, "Couldn't bind to ux_socket, error %d", errno);
 		close(fd);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
