Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 62CD3249F67
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:18:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-CIIzjWBsMfW8kgjh-LzU_w-1; Wed, 19 Aug 2020 09:18:53 -0400
X-MC-Unique: CIIzjWBsMfW8kgjh-LzU_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 224161019629;
	Wed, 19 Aug 2020 13:18:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 010715C3E0;
	Wed, 19 Aug 2020 13:18:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD70E1832FC3;
	Wed, 19 Aug 2020 13:18:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDIjjv020924 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:18:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 056512166B28; Wed, 19 Aug 2020 13:18:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 015182166BCC
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79AA1984BA9
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-20-xI68i4vfOQ2fPBQuq-nXQA-1;
	Wed, 19 Aug 2020 09:18:38 -0400
X-MC-Unique: xI68i4vfOQ2fPBQuq-nXQA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 03837AC79;
	Wed, 19 Aug 2020 13:19:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:18:15 +0200
Message-Id: <20200819131819.13493-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07JDIjjv020924
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 00/87] multipath-tools series part VII:
	addional patches
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This is v3 of part VII of a larger patch series for multipath-tools I've
been preparing. It's based on the previously submitted part VI.

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-200819
This part is tagged "submit-200819-7".

This part contains patches added since the v1 and v2 submissions of the series.
One is Liu's fix for disassemble_map(), rebased on top of my previous changes
to that function.

84/87, related to inconsistent alias settings, belongs logically to part III.
I couldn't add it there because it would have changed the numbering in the
series wrt v1, which I wanted to avoid.

Changes v2 -> v3, as suggested by Ben Marzinski:

 84/87 "libmultipath: add consistency check for alias settings"
   - fixed possible freeing of NULL pointer
   - search vector backwards in add_binding()
   - avoid fd leak in check_alias_settings()

 85/87 "libmultipath: alias.c: use strtok_r() instead of strtok()"
   - new, provide thread safety in alias.c

 86/87 "libmultipath: adopt_paths(): set pp->mpp only on success"
   - new, implement Ben's suggestion in his review of patch 54 in the
     v2 series ("[PATCH v2 44/54] libmultipath: adopt_paths(): don't 
     bail out on single path failure")

Besides, a trivial warning fix was added (87/87).

Martin Wilck (6):
  multipath: check_path_valid(): eliminate some failure modes
  libmultipath: alias: static const variable for BINDINGS_FILE_HEADER
  libmultipath: add consistency check for alias settings
  libmultipath: alias.c: use strtok_r() instead of strtok()
  libmultipath: adopt_paths(): set pp->mpp only on success
  libmultipath: fix a -Wformat-truncation warning from gcc 10

Zhiqiang Liu (1):
  libmultipath: free pp if store_path fails in disassemble_map

 libmultipath/alias.c       | 294 +++++++++++++++++++++++++++++++++++--
 libmultipath/alias.h       |  15 +-
 libmultipath/dmparser.c    |  12 +-
 libmultipath/structs_vec.c |  15 +-
 libmultipath/util.c        |   6 +-
 multipath/main.c           |  21 +--
 multipathd/main.c          |   3 +
 7 files changed, 327 insertions(+), 39 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

