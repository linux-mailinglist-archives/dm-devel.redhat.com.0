Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FB5A6D52
	for <lists+dm-devel@lfdr.de>; Tue, 30 Aug 2022 21:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661887710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LO5EK8vkN9+qXwAjB/nMkTQM/ueyWKyg2Q0BRnxJLhI=;
	b=VyU2eclTQPjy2HvGtPa5hrbMQM2RV9wUcr0VF7uoAQH49/hTLxJlOoeDLqNAJe/EOGWs9b
	wMnYuQ+SoIjHGX14P8Wf9R1Hn/8VqiVDUMFRgDLGjbgysGvYKG9U3aZ2G/uyu6hqRWS6kF
	onIfViCDt1k4EzrRz2EStdRkIYX12sA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-0HLZ8C2VOY6w3DEzBhPv-w-1; Tue, 30 Aug 2022 15:28:29 -0400
X-MC-Unique: 0HLZ8C2VOY6w3DEzBhPv-w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06639296A62D;
	Tue, 30 Aug 2022 19:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E41BE492CA5;
	Tue, 30 Aug 2022 19:28:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D082F1946A45;
	Tue, 30 Aug 2022 19:28:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 75B211946A69
 for <dm-devel@listman.corp.redhat.com>; Tue, 30 Aug 2022 19:28:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 594722026D64; Tue, 30 Aug 2022 19:28:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 557A62026D4C
 for <dm-devel@redhat.com>; Tue, 30 Aug 2022 19:28:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37B933C4CA86
 for <dm-devel@redhat.com>; Tue, 30 Aug 2022 19:28:19 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-621-YkfO0MNvOEaTz899fSTa6A-1; Tue,
 30 Aug 2022 15:28:15 -0400
X-MC-Unique: YkfO0MNvOEaTz899fSTa6A-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB7AD21E8C;
 Tue, 30 Aug 2022 19:28:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7852413B0C;
 Tue, 30 Aug 2022 19:28:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uEmhG8xkDmO5GgAAMHmgww
 (envelope-from <mwilck@suse.com>); Tue, 30 Aug 2022 19:28:12 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 30 Aug 2022 21:27:11 +0200
Message-Id: <20220830192713.19778-11-mwilck@suse.com>
In-Reply-To: <20220830192713.19778-1-mwilck@suse.com>
References: <20220830192713.19778-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [dm-devel] [PATCH v4 10/12] multipathd: exec multipathc in
 interactive mode
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

A previous patch disabled interactive mode in multipathd, because
uxclnt() would return immediately without an input command.

With this patch, we reinstate interactive mode for "multipath -k",
by just exec()ing the multipathc client.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/Makefile     |  3 ++-
 multipathd/main.c       | 15 +++++++++++++--
 multipathd/multipathc.c | 25 +++++++++++++++++++++----
 3 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/multipathd/Makefile b/multipathd/Makefile
index 19ab2e9..8a56304 100644
--- a/multipathd/Makefile
+++ b/multipathd/Makefile
@@ -17,7 +17,8 @@ endif
 
 CPPFLAGS += -I$(multipathdir) -I$(mpathutildir) -I$(mpathpersistdir) -I$(mpathcmddir) -I$(thirdpartydir) \
 	$(shell $(PKGCONFIG) --modversion liburcu 2>/dev/null | \
-		awk -F. '{ printf("-DURCU_VERSION=0x%06x", 256 * ( 256 * $$1 + $$2) + $$3); }')
+		awk -F. '{ printf("-DURCU_VERSION=0x%06x", 256 * ( 256 * $$1 + $$2) + $$3); }') \
+	-DBINDIR='"$(bindir)"'
 CFLAGS += $(BIN_CFLAGS)
 LDFLAGS += $(BIN_LDFLAGS)
 
diff --git a/multipathd/main.c b/multipathd/main.c
index 5a40894..66177cd 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3616,7 +3616,7 @@ main (int argc, char *argv[])
 	extern char *optarg;
 	extern int optind;
 	int arg;
-	int err;
+	int err = 0;
 	int foreground = 0;
 	struct config *conf;
 	char *opt_k_arg = NULL;
@@ -3710,7 +3710,18 @@ main (int argc, char *argv[])
 			}
 			c += snprintf(c, s + CMDSIZE - c, "\n");
 		}
-		err = uxclnt(s, uxsock_timeout + 100);
+		if (!s) {
+			char tmo_buf[16];
+
+			snprintf(tmo_buf, sizeof(tmo_buf), "%d",
+				 uxsock_timeout + 100);
+			if (execl(BINDIR "/multipathc", "multipathc",
+				  tmo_buf, NULL) == -1) {
+				condlog(0, "ERROR: failed to execute multipathc: %m");
+				err = 1;
+			}
+		} else
+			err = uxclnt(s, uxsock_timeout + 100);
 		free_config(conf);
 		return err;
 	}
diff --git a/multipathd/multipathc.c b/multipathd/multipathc.c
index a4f9023..9d49655 100644
--- a/multipathd/multipathc.c
+++ b/multipathd/multipathc.c
@@ -246,14 +246,31 @@ static void process(int fd, unsigned int timeout)
 	}
 }
 
-int main (void)
+int main (int argc, const char * const argv[])
 {
-	int fd = mpath_connect();
+	int fd;
+	int tmo = DEFAULT_REPLY_TIMEOUT + 100;
+	char *ep;
 
-	if (fd == -1)
+	if (argc > 2) {
+		fprintf(stderr, "Usage: %s [timeout]\n", argv[0]);
 		return 1;
+	}
+	if (argc == 2) {
+		tmo = strtol(argv[1], &ep, 10);
+		if (*argv[1] == '\0' || *ep != '\0' || tmo < 0) {
+			fprintf(stderr, "ERROR: invalid timeout value\n");
+			return 1;
+		}
+	}
 
-	process(fd, DEFAULT_REPLY_TIMEOUT + 100);
+	fd = mpath_connect();
+	if (fd == -1) {
+		fprintf(stderr, "ERROR: failed to connect to multipathd\n");
+		return 1;
+	}
+
+	process(fd, tmo);
 	mpath_disconnect(fd);
 	return 0;
 }
-- 
2.37.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

