Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 362FF260DCB
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 10:41:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-UQPMAMItOdqpNxUgbjmkJQ-1; Tue, 08 Sep 2020 04:41:32 -0400
X-MC-Unique: UQPMAMItOdqpNxUgbjmkJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DC8251B9;
	Tue,  8 Sep 2020 08:41:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8AFA5C1BB;
	Tue,  8 Sep 2020 08:41:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA71618095FF;
	Tue,  8 Sep 2020 08:41:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0888fBbI015642 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 04:41:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1B6C2142F49; Tue,  8 Sep 2020 08:41:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAB282166B44
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:41:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D1D801224
	for <dm-devel@redhat.com>; Tue,  8 Sep 2020 08:41:09 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-NbjWlkzPPWKRb0X12IvnOg-1; Tue, 08 Sep 2020 04:41:04 -0400
X-MC-Unique: NbjWlkzPPWKRb0X12IvnOg-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 59B58EDE2EF47CE9EB77;
	Tue,  8 Sep 2020 16:41:00 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.232) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 8 Sep 2020 16:40:52 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
Message-ID: <2fb59aa1-eafa-49b6-08aa-a279565ec234@huawei.com>
Date: Tue, 8 Sep 2020 16:40:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.179.232]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V3 00/14] multipath-tools series: some cleanups
 and fixes checked by codedex tool
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
Content-Language: en-GB

Patches 01, 02, 04, 05, 06, 09, 11, 12, 14 have some changes.

V3 is same as V2.

Changes in V2:
- patch 01: set major and minor to -1 at begining, as suggested
  by Martin Wilck
- patch 02: chanege malloc to calloc to calloc, as suggested by
  Martin Wilck
- patch 04: delete seting ret when jump to out, as suggested by
  Martin Wilck
- patch 05: turn back MALLOC to malloc and reomve error message,
  as suggested by Martin Wilck
- patch 06: change malloc to xmalloc, as suggested by Martin Wilck
- patch 09: use ?: instead of checking mp->features, as suggested
  by Benjamin Marzinski
- patch 11: change num_transport to num_transportids to combine them,
  as suggested by Benjamin Marzinski
- patch 12: delete continue and add remove_map, as suggested by
  Martin Wilck
- patch 14: modify patch because of patch 11 "mpathpersist: check
  whether malloc paramp->trnptid_list fails in handle_args func"
  changing

Zhiqiang Liu (7):
  multipathd: use MALLOC and check return value in cli_getprkey func
  kpartx: check return value of malloc in main func
  libmultipath: check return value of dm_mapname in sysfs_check_holders
  libmultipath: donot free *dst if REALLOC fails in merge_words
  libmultipath: check whether mp->features is NUll in assemble_map
  util/tests: use assert_non_null to ensure malloc returns non-null
    pointer
  mpathpersist: check whether malloc paramp->trnptid_list fails in
    handle_args func

lixiaokeng (7):
  multipathd: initialize major and minor in cli_add_map
  libmultipath: change malloc to calloc in print_foreign_topology
  libmultipath: use map instead of dm_task_get_name
  multipathd: check MALLOC return value in mpath_pr_event_handler_fn
  libmultipathpersist: use update_multipath_table/status in get_mpvec
  multipath: use update_multipath_table/status in check_useable_paths
  multipathpersist: delete unused variable in handle_args

 kpartx/kpartx.c                 |  5 ++-
 libmpathpersist/mpath_persist.c | 15 +++-----
 libmultipath/devmapper.c        |  2 +-
 libmultipath/dmparser.c         | 17 +++------
 libmultipath/foreign.c          |  4 +-
 libmultipath/sysfs.c            |  6 ++-
 mpathpersist/main.c             | 66 +++++++++++++++++++++++++--------
 multipath/main.c                |  9 ++---
 multipathd/cli_handlers.c       |  4 +-
 multipathd/main.c               |  8 ++--
 tests/util.c                    |  2 +
 11 files changed, 86 insertions(+), 52 deletions(-)

--

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

