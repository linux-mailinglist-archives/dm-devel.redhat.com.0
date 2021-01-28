Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3937307FE9
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 21:52:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-4r92OJkgM3yTJRaVV2pqtA-1; Thu, 28 Jan 2021 15:52:20 -0500
X-MC-Unique: 4r92OJkgM3yTJRaVV2pqtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1816C801FD6;
	Thu, 28 Jan 2021 20:52:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BB5660C67;
	Thu, 28 Jan 2021 20:52:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57AA64BB7B;
	Thu, 28 Jan 2021 20:52:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SKlBFi015110 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 15:47:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C8303103432; Thu, 28 Jan 2021 20:47:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF8B4103787
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 20:47:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FB3F18A0160
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 20:47:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-169-UnhEYAsoPvi-EV8jsJ6QtA-1;
	Thu, 28 Jan 2021 15:46:00 -0500
X-MC-Unique: UnhEYAsoPvi-EV8jsJ6QtA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7EADFAAC6;
	Thu, 28 Jan 2021 20:45:58 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 28 Jan 2021 21:45:41 +0100
Message-Id: <20210128204544.18563-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10SKlBFi015110
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/3] multipath: fixes for SAS expanders and root
	FS access
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

here are 3 patches I'd like to get reviewed before we create a pull
request. The first two are related to complex SAS setups, the second
one is to avoid accessing the root file system in a possible dangerous
situation.

Wrt 2/3: while testing it, I discovered that "I_T_nexus_loss_timeout"
is a read-only sysfs attribute, therefore this code does nothing.
I considered removing it altogether, observing that the attribute has
been read-only as long as it existed (v2.6.17, 2006). I'd like some
feedback beforehand, though, perhaps some distros use patched kernels
that make this attribute r/w?

Regards
Martin

Martin Wilck (3):
  libmultipath: use 3rd digit as transport_id for expanders
  libmultipath: sysfs_set_nexus_loss_tmo(): support SAS expanders
  multipathd: add code to initalize unwinder

 libmultipath/discovery.c   | 35 ++++++++++++++++++++++++++++-------
 multipathd/Makefile        |  2 +-
 multipathd/init_unwinder.c | 34 ++++++++++++++++++++++++++++++++++
 multipathd/init_unwinder.h | 21 +++++++++++++++++++++
 multipathd/main.c          |  2 ++
 5 files changed, 86 insertions(+), 8 deletions(-)
 create mode 100644 multipathd/init_unwinder.c
 create mode 100644 multipathd/init_unwinder.h

-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

