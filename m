Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4A54DE418
	for <lists+dm-devel@lfdr.de>; Fri, 18 Mar 2022 23:34:14 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-mv9WRcsLNHq8JxtSWjenIQ-1; Fri, 18 Mar 2022 18:34:09 -0400
X-MC-Unique: mv9WRcsLNHq8JxtSWjenIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F6DF10544A8;
	Fri, 18 Mar 2022 22:34:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34DC9C27E81;
	Fri, 18 Mar 2022 22:33:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5DB51964190;
	Fri, 18 Mar 2022 22:33:55 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C20261940370
 for <dm-devel@listman.corp.redhat.com>; Fri, 18 Mar 2022 22:33:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 76AB040FF415; Fri, 18 Mar 2022 22:33:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D3540FF40F
 for <dm-devel@redhat.com>; Fri, 18 Mar 2022 22:33:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45A303C02B89
 for <dm-devel@redhat.com>; Fri, 18 Mar 2022 22:33:52 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-grNRKKHONTKvQYjNDi7kbQ-1; Fri, 18 Mar 2022 18:33:50 -0400
X-MC-Unique: grNRKKHONTKvQYjNDi7kbQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EAF421108;
 Fri, 18 Mar 2022 22:33:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 310AC132D4;
 Fri, 18 Mar 2022 22:33:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1A4QCswINWLSdwAAMHmgww
 (envelope-from <mwilck@suse.com>); Fri, 18 Mar 2022 22:33:48 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Guozhonghua <guozh88@chinatelecom.cn>
Date: Fri, 18 Mar 2022 23:33:28 +0100
Message-Id: <20220318223339.4226-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [dm-devel] [PATCH v2 00/11] multipathd: fix __delayed_reconfig logic
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Ben, hi Christophe, hi Guozhonghua,

here's my new take at the race condition issue reported by Guozhonghua.
This patch set is meant as an alternative to Ben's recent series
"fix looping when reconfigure is delayed". I believe that by removing
the special case from __post_config_state(), the state change logic
becomes somewhat easier to understand again.

I hope I got it right this time.

Changes v1->v2:

 04: reset __delayed_reconfig if no delay needed (Ben)
     only call __post_config_state in IDLE state (Ben)
 06/07: unblock reconfigure if maps are removed, as suggested by Ben
 08-11: minor logging fixes I found useful

Regards
Martin

Martin Wilck (11):
  multipathd: child(): remove superfluous if condition
  multipathd: set reload_type in when calling reconfigure()
  multipathd: avoid busy loop in child() for delayed reconfigure
  multipathd: reset __delayed_reconfig from ev_add_map()
  multipathd: remove volatile qualifier from running_state
  libmultipath: add callback for remove_map()
  multipathd: use remove_map_callback for delayed reconfigure
  libmultipath: warn only once about deprecated options
  multipathd: improve logging of reconfigure()
  multipathd: log state changes
  multipathd: remove unhelpful startup / shutdown messages

 libmultipath/dict.c               |  15 ++-
 libmultipath/libmultipath.version |   3 +-
 libmultipath/structs_vec.c        |   6 ++
 multipathd/main.c                 | 172 ++++++++++++++++--------------
 4 files changed, 109 insertions(+), 87 deletions(-)

-- 
2.35.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

