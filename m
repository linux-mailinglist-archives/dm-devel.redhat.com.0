Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2A92428C3
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:35:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-_tSBWnGGOxqsw0KFeQktWA-1; Wed, 12 Aug 2020 07:35:54 -0400
X-MC-Unique: _tSBWnGGOxqsw0KFeQktWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6C0E1005E6A;
	Wed, 12 Aug 2020 11:35:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E2D6973A;
	Wed, 12 Aug 2020 11:35:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF2EFA5558;
	Wed, 12 Aug 2020 11:35:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZBjr028695 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D83A20316DA; Wed, 12 Aug 2020 11:35:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 391E920316D6
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BBD2800BED
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:09 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-561-BfLKYJqRPuutTmV-Zxpg1Q-1;
	Wed, 12 Aug 2020 07:35:05 -0400
X-MC-Unique: BfLKYJqRPuutTmV-Zxpg1Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4CBB3B6F7;
	Wed, 12 Aug 2020 11:35:25 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:34:27 +0200
Message-Id: <20200812113429.26314-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZBjr028695
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/54] multipath-tools series part IV:
	identify paths by dev_t
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is part IV of a larger patch series for multipath-tools I've been preparing.
It's based on the previously submitted part III.

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2008
This part is tagged "submit-200812-4".

The dominant idea of the patches in this subseries is to move away from
the device node name as the main path identifier towards the dev_t aka
major/minor number. This is motivated by the fact that dev_t is used by the
kernel device mapper for referring to devices, both maps and paths.
If searching a device by dev_t fails, it's basically certain not to exist.
DM calls with major/minor number may even succeed if the respective devnode
has not been created yet. dev_t also works better for devices that aren't
fully initialized yet. Of course we still track the device name, but mostly
for log messages and user-directed output.

In short, using dev_t as primary identifier makes our code more robust.

The subseries also contains some unrelated fixes for functions I worked on
while making these changes.

Changes v1 -> v2, as suggested by Ben Marzinski:

 * 44/54: "libmultipath: adopt_paths(): don't bail out on single path failure"
    - fail if adding a specific path was requested and failed. 
 * 46/54: "libmultipath: path_discover(): always set DI_BLACKLIST"
    - dropped, replaced by "libmultipath: path_discover(): explain pathinfo flags",
      which contains only comments

NOTE: In my v1 submission, I made a mistake when sending part V, so that
*patch number 54 is present twice* in the full series.
I deliberately didn't correct that this time, to preserve numbering.

Martin Wilck (12):
  libmultipath: adopt_paths(): use find_path_by_devt()
  libmultipath: adopt_paths(): don't bail out on single path failure
  libmultipath: path_discover(): use find_path_by_devt()
  libmultipath: path_discover(): explain pathinfo flags
  libmultipath: get_refwwid(): use find_path_by_devt()
  libmultipath: get_refwwid(): call get_multipath_config() only once
  libmultipath: get_refwwid(): get rid of "check" label
  libmultipath: get_refwwid(): use symbolic return values
  libmultipath: get_refwwid(): use switch statement
  libmultipath: constify get_mpe_wwid()
  multipath: call strchop() on command line argument
  libmultipath: get_refwwid(): skip strchop(), and constify dev
    parameter

 libmultipath/config.c      |   2 +-
 libmultipath/config.h      |   2 +-
 libmultipath/configure.c   | 200 +++++++++++++------------------------
 libmultipath/configure.h   |   2 +-
 libmultipath/discovery.c   |  37 ++++---
 libmultipath/structs_vec.c |  17 ++--
 multipath/main.c           |   2 +
 multipathd/main.c          |   3 +-
 8 files changed, 103 insertions(+), 162 deletions(-)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

