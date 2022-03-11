Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D93044D57DD
	for <lists+dm-devel@lfdr.de>; Fri, 11 Mar 2022 03:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646964148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h1/H5hRzE7MEGzjQt2y6l82jDGaDrtDAqFuy8HODL5k=;
	b=J5xbSzzuSJ9OcoHwkJZ8dWf7zwUAd+t3ULqvWiEDrCwcC4x+gK0Hi0a/TUG3bc1BSZ8X2w
	oJjC19Jw3y0GPxWqVrEDl4mW5Ks41Zqns7/JrXo/lumPdqGDmqoLvKs0NBHaPngqUfd9o6
	oVl5IYuWRTzSWczCISks/iNScNsVmkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-TaH6FKdiPIm1w3eMehkI_w-1; Thu, 10 Mar 2022 21:02:27 -0500
X-MC-Unique: TaH6FKdiPIm1w3eMehkI_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69E66802A67;
	Fri, 11 Mar 2022 02:02:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69B57C15E6F;
	Fri, 11 Mar 2022 02:02:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9913197166E;
	Fri, 11 Mar 2022 02:02:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5279119641B9
 for <dm-devel@listman.corp.redhat.com>; Fri, 11 Mar 2022 02:02:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 14ADF1897D; Fri, 11 Mar 2022 02:02:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3981183CA;
 Fri, 11 Mar 2022 02:02:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 22B22DsI021846;
 Thu, 10 Mar 2022 20:02:13 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 22B22DIF021845;
 Thu, 10 Mar 2022 20:02:13 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 10 Mar 2022 20:02:10 -0600
Message-Id: <1646964130-21800-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1646964130-21800-1-git-send-email-bmarzins@redhat.com>
References: <1646964130-21800-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [dm-devel] [PATCH 2/2] multipathd: don't keep looping when config
 is delayed
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Guozhonghua <guozh88@chinatelecom.cn>, Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a reconfigure is delayed because multipathd is waiting on a change
uevent for a new multipath device, the main thread will not pause, but
will keep looping and rechecking to see if it can reconfigure.

To solve this, when __post_config_state(DAEMON_IDLE) is called, if
__delayed_reconfig is set we really do want to switch to the
DAEMON_IDLE state, even if there is a pending reconfigure, since it's
being delayed. When the last change uevent for a new map arrives (or
we time out waiting for it), a reconfigure will get triggered.

However, we need to avoid a race where the main thread calls
enable_delayed_reconfig() and sets __delayed_reconfig, and then the
uevent thread processes a change uevent that sets the state to
DAEMON_CONFIGURE, an then the main thread calls post_config_state().
In this case, multipathd would move to DAEMON_IDLE, even though
the reconfigure should no longer be delayed. To avoid this, when
schedule_reconfigure() is called and the daemon is currently in
DAEMON_CONFIGURE or DAEMON_RUNNING, __delayed_reconfig should be
cleared, so switching to DAEMON_IDLE will instead become
DAEMON_CONFIGURE.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index 86b1745a..9bd1f530 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -309,6 +309,7 @@ static void __post_config_state(enum daemon_status state)
 		 * again and start another reconfigure cycle.
 		 */
 		if (reconfigure_pending != FORCE_RELOAD_NONE &&
+		    !__delayed_reconfig &&
 		    state == DAEMON_IDLE &&
 		    (old_state == DAEMON_CONFIGURE ||
 		     old_state == DAEMON_RUNNING)) {
@@ -353,6 +354,7 @@ void schedule_reconfigure(enum force_reload_types requested_type)
 		break;
 	case DAEMON_CONFIGURE:
 	case DAEMON_RUNNING:
+		__delayed_reconfig = false;
 		reconfigure_pending = type;
 		break;
 	default:
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

