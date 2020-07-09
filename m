Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 64FAD219E09
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:38:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-pbnqkcWvOlaYKDhZWCx4Ng-1; Thu, 09 Jul 2020 06:37:03 -0400
X-MC-Unique: pbnqkcWvOlaYKDhZWCx4Ng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCEF010B0;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9578C6111F;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ABFE93F91;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069Aalfc031573 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4238114B2FE; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF5271000DAA
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78B1D100E7C3
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-48-E86gHGv7OauuiWeYG9iqPw-1;
	Thu, 09 Jul 2020 06:36:41 -0400
X-MC-Unique: E86gHGv7OauuiWeYG9iqPw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 37C33AE39;
	Thu,  9 Jul 2020 10:36:40 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:11 +0200
Message-Id: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069Aalfc031573
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 00/54] multipath-tools series part IV: identify
	paths by dev_t
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

This is part IV of a larger patch series for multipath-tools I've been preparing.
It's based on the previously submitted part III.

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2007

There are tags in that repo for each part of the series.
This part is tagged "submit-200709-4".

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

Regards,
Martin

Martin Wilck (12):
  libmultipath: adopt_paths(): use find_path_by_devt()
  libmultipath: adopt_paths(): don't bail out on single path failure
  libmultipath: path_discover(): use find_path_by_devt()
  libmultipath: path_discover(): always set DI_BLACKLIST
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
 libmultipath/discovery.c   |  32 +++---
 libmultipath/structs_vec.c |  14 ++-
 multipath/main.c           |   2 +
 7 files changed, 94 insertions(+), 160 deletions(-)

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

