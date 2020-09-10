Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEBAD26447B
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 12:46:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-UxvRf2LJPTePdBTzM_w0Kw-1; Thu, 10 Sep 2020 06:46:39 -0400
X-MC-Unique: UxvRf2LJPTePdBTzM_w0Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED88C801AB8;
	Thu, 10 Sep 2020 10:46:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6A210027A4;
	Thu, 10 Sep 2020 10:46:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44F3A922E8;
	Thu, 10 Sep 2020 10:46:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AAjkJe022888 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 06:45:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44F5D2156A2D; Thu, 10 Sep 2020 10:45:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 409842156A23
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:45:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB368906389
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:45:43 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-373-HZNA2o-5M6m2mK_HbdO5FQ-1; Thu, 10 Sep 2020 06:45:37 -0400
X-MC-Unique: HZNA2o-5M6m2mK_HbdO5FQ-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8547CD38DCA895B33CE1;
	Thu, 10 Sep 2020 18:45:28 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.208) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 10 Sep 2020 18:45:18 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
Date: Thu, 10 Sep 2020 18:45:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.208]
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
Subject: [dm-devel] [PATCH V4 00/14] multipath-tools series: some cleanups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Patches 01, 02, 04, 05, 06, 09, 11, 12, 14 have some changes

Patches 01, 02, 04, 05, 11, 12, 14: change commit message
Patches 06: move xmalloc before main
Patches 09: check strdup result in setup_map, add message
"mp->features must not be NULL" in assemble_map

Zhiqiang Liu (7):
  multipathd: check return value of malloc in cli_getprkey func
  kpartx: use xmalloc to instead of malloc in main func
  libmultipath: check return value of dm_mapname in sysfs_check_holders
  libmultipath: donot free *dst if REALLOC fails in merge_words
  libmultipath: check whether mpp->features is NUll in setup_map
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

 kpartx/kpartx.c                 | 36 +++++++++---------
 libmpathpersist/mpath_persist.c | 15 +++-----
 libmultipath/configure.c        |  5 +++
 libmultipath/devmapper.c        |  2 +-
 libmultipath/dmparser.c         | 18 ++++-----
 libmultipath/foreign.c          |  4 +-
 libmultipath/sysfs.c            |  6 ++-
 mpathpersist/main.c             | 66 +++++++++++++++++++++++++--------
 multipath/main.c                |  9 ++---
 multipathd/cli_handlers.c       |  4 +-
 multipathd/main.c               |  8 ++--
 tests/util.c                    |  2 +
 12 files changed, 106 insertions(+), 69 deletions(-)

--

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

