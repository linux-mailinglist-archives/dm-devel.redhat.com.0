Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E6E4BAA69
	for <lists+dm-devel@lfdr.de>; Thu, 17 Feb 2022 20:56:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-VNRJuZbxP5uQU2aQTAIbTg-1; Thu, 17 Feb 2022 14:56:02 -0500
X-MC-Unique: VNRJuZbxP5uQU2aQTAIbTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C7491091DA1;
	Thu, 17 Feb 2022 19:55:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2D21017E35;
	Thu, 17 Feb 2022 19:55:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BD2B4BB7C;
	Thu, 17 Feb 2022 19:55:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HJtfdg005139 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 14:55:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6065414582FA; Thu, 17 Feb 2022 19:55:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C5C914582F7
	for <dm-devel@redhat.com>; Thu, 17 Feb 2022 19:55:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7D11C05EC4
	for <dm-devel@redhat.com>; Thu, 17 Feb 2022 19:55:41 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-449-t6GqWNrsOGa19QInTrj0Mw-1; Thu, 17 Feb 2022 14:55:37 -0500
X-MC-Unique: t6GqWNrsOGa19QInTrj0Mw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 433551F383;
	Thu, 17 Feb 2022 19:55:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01E9313476;
	Thu, 17 Feb 2022 19:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id SHfiODeoDmLBVgAAMHmgww
	(envelope-from <mwilck@suse.com>); Thu, 17 Feb 2022 19:55:35 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 17 Feb 2022 20:55:29 +0100
Message-Id: <20220217195533.4251-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 21HJtfdg005139
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/4] libmultipath: utter less dev_loss_tmo
	warnings
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe,

since 3ab1f3b ("libmultipath: print message if setting dev_loss_tmo is unsupported"),
multipathd prints a warning at level 2 for every map for which dev_loss_tmo can't
be set. This results in a large number of warnings if there are many maps with such
unsupported protocols, like this:

multipathd[1398]: 36001405328d6683b6cb4739943adf643: setting dev_loss_tmo is unsupported for protocol scsi:unspec

This patch set makes changes the code to print this warning only once per unsupported
protocol. It would have been simpler to never print the warning more than once, but
I figured that might suppress important information in some cases.

Regards
Martin

Martin Wilck (4):
  libmultipath: enable linear ordering of bus/proto tuple
  libmultipath: use bus_protocol_id() in snprint_path_protocol()
  libmultipath: enable defining a static bitfield
  libmultipath: only warn once about unsupported dev_loss_tmo

 libmultipath/discovery.c |  4 ++-
 libmultipath/print.c     | 58 +++++++++++++++-------------------------
 libmultipath/structs.c   | 10 +++++++
 libmultipath/structs.h   | 13 +++++++--
 libmultipath/util.h      | 10 +++++++
 5 files changed, 55 insertions(+), 40 deletions(-)

-- 
2.35.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

