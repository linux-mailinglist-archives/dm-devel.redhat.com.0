Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 942E81CFF81
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 22:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589315983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RhFXZ8YIvn+hLk+D/A+OKV1uQa8uyZ4WzseF/9Omz7Y=;
	b=dl9yB8lp+5dAqdT6GYFDu3EoOFrT3BvFlQN9J3/VQRmiIEOmLmMwd2SiNSuSDID3enS7Oz
	SskTIcVt0J42vosdY2VtJyFG5qBy/7gK0d9rhdSMpSJ4AcMtljTW4QcnZYfaw4ijKwKrfQ
	v1BlmqjlBEYyc6ipxeXtSblWdFn+t8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-RtkJJH3aPlCNkjbhGP5vGQ-1; Tue, 12 May 2020 16:39:37 -0400
X-MC-Unique: RtkJJH3aPlCNkjbhGP5vGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6358510CE781;
	Tue, 12 May 2020 20:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D1A10002AA;
	Tue, 12 May 2020 20:39:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98AC64CAA8;
	Tue, 12 May 2020 20:39:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CKcvSv018742 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 16:38:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A34CB2166B27; Tue, 12 May 2020 20:38:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4732156A3D
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:38:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F7DF1859163
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:38:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-144-K1R-5Yn_OpSMYW8MB8CDng-1;
	Tue, 12 May 2020 16:38:52 -0400
X-MC-Unique: K1R-5Yn_OpSMYW8MB8CDng-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6F6AEACC2;
	Tue, 12 May 2020 20:38:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 22:38:20 +0200
Message-Id: <20200512203822.18910-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04CKcvSv018742
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/2] More minor libmultipath fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

this is a follow-up on yesterday's "Minor fixes for multipath-tools"
series. It adds fixes for sporadic build failures I observed.
The libsg move is a long-overdue cleanup.

Regards
Martin

Martin Wilck (2):
  libmultipath: move libsg into libmultipath
  multipath-tools Makefile: add install dependency

 Makefile                            | 4 ++++
 libmultipath/Makefile               | 3 ++-
 libmultipath/checkers/Makefile      | 6 +++---
 libmultipath/{checkers => }/libsg.c | 0
 libmultipath/{checkers => }/libsg.h | 0
 libmultipath/prioritizers/Makefile  | 2 +-
 6 files changed, 10 insertions(+), 5 deletions(-)
 rename libmultipath/{checkers => }/libsg.c (100%)
 rename libmultipath/{checkers => }/libsg.h (100%)

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

