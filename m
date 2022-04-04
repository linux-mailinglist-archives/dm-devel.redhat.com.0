Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CA4F1988
	for <lists+dm-devel@lfdr.de>; Mon,  4 Apr 2022 19:05:57 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-BrYL3Kh8Nb6bQjAp-5Mv3w-1; Mon, 04 Apr 2022 13:05:54 -0400
X-MC-Unique: BrYL3Kh8Nb6bQjAp-5Mv3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E047899EDD;
	Mon,  4 Apr 2022 17:05:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 545FB40CF8FE;
	Mon,  4 Apr 2022 17:05:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 212C51940378;
	Mon,  4 Apr 2022 17:05:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A8E9194037C
 for <dm-devel@listman.corp.redhat.com>; Mon,  4 Apr 2022 17:05:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F13187AE2; Mon,  4 Apr 2022 17:05:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECDA876C4
 for <dm-devel@redhat.com>; Mon,  4 Apr 2022 17:05:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DF01833959
 for <dm-devel@redhat.com>; Mon,  4 Apr 2022 17:05:35 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-9_l511w4MqChED8n17wFoA-1; Mon, 04 Apr 2022 13:05:33 -0400
X-MC-Unique: 9_l511w4MqChED8n17wFoA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2CC101F388;
 Mon,  4 Apr 2022 17:05:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E837C12FC5;
 Mon,  4 Apr 2022 17:05:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qDiiNlslS2LICAAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 04 Apr 2022 17:05:31 +0000
From: mwilck@suse.com
To: Benjamin Marzinski <bmarzins@redhat.com>,
 Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon,  4 Apr 2022 19:04:54 +0200
Message-Id: <20220404170457.16021-13-mwilck@suse.com>
In-Reply-To: <20220404170457.16021-1-mwilck@suse.com>
References: <20220404170457.16021-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH v2 12/15] libmultipath: uevent: improve log
 messages
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0682332943297764798=="

--===============0682332943297764798==
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: Martin Wilck <mwilck@suse.com>

Use common format "\add sdl\", and log this detail only at
verbosity 4.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/uevent.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index 6e8c443..0dccb0b 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -390,9 +390,9 @@ uevent_filter(struct uevent *later, struct uevent_filte=
r_state *st)
 =09=09=09}
 =09=09}
 =09=09if (uevent_can_filter(earlier, later)) {
-=09=09=09condlog(3, "uevent: %s-%s has filtered by uevent: %s-%s",
-=09=09=09=09earlier->kernel, earlier->action,
-=09=09=09=09later->kernel, later->action);
+=09=09=09condlog(4, "uevent: \"%s %s\" filtered by \"%s %s\"",
+=09=09=09=09earlier->action, earlier->kernel,
+=09=09=09=09later->action, later->kernel);
=20
 =09=09=09uevent_delete_from_list(earlier, &tmp, &st->old_tail);
 =09=09=09st->filtered++;
@@ -411,8 +411,8 @@ static void uevent_merge(struct uevent *later, struct u=
event_filter_state *st)
 =09=09 * merge earlier uevents to the later uevent
 =09=09 */
 =09=09if (uevent_can_merge(earlier, later)) {
-=09=09=09condlog(3, "merged uevent: %s-%s-%s with uevent: %s-%s-%s",
-=09=09=09=09earlier->action, earlier->kernel, earlier->wwid,
+=09=09=09condlog(4, "uevent: \"%s %s\" merged with \"%s %s\" for WWID %s",
+=09=09=09=09earlier->action, earlier->kernel,
 =09=09=09=09later->action, later->kernel, later->wwid);
=20
 =09=09=09/* See comment in uevent_delete_from_list() */
--=20
2.35.1


--===============0682332943297764798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============0682332943297764798==--

