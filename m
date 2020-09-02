Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 02BE125A5A8
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 08:41:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-jyKigHMsMnqN38yiaKUPHg-1; Wed, 02 Sep 2020 02:41:45 -0400
X-MC-Unique: jyKigHMsMnqN38yiaKUPHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2147C1074642;
	Wed,  2 Sep 2020 06:41:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E32910013BD;
	Wed,  2 Sep 2020 06:41:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3265A180B656;
	Wed,  2 Sep 2020 06:41:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0826fCq6023837 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 02:41:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3CCF920235B7; Wed,  2 Sep 2020 06:41:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3546C202450A
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:41:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C3E518AE947
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 06:41:07 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-deOhibf_Oxmy1xjgiQIh7Q-1; Wed, 02 Sep 2020 02:41:01 -0400
X-MC-Unique: deOhibf_Oxmy1xjgiQIh7Q-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 23DD3A5383658690F939;
	Wed,  2 Sep 2020 14:40:50 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	14:40:39 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Date: Wed, 2 Sep 2020 14:40:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 00/14] multipath-tools series: some cleanups and
 fixes checked by codedex tool
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

Hi:
    Now, we check multipath-tools codes with codedex tool. Here
are some some cleanups and fixes.

Zhiqiang Liu (7):
  multipathd: use MALLOC and check return value in cli_getprkey func
  kpartx: check return value of malloc in main func
  libmultipath: check return value of dm_mapname in sysfs_check_holders
  libmultipath: donot free *dst if REALLOC fails in merge_words
  libmultipath: check whether mp->features is NULl in assemble_map
  util/tests: use assert_non_null to ensure malloc returns non-null
    pointer
  mpathpersist: check whether malloc paramp->trnptid_list fails in
    handle_args func

lixiaokeng (7):
  multipathd: return if dm_get_major_minor failed in cli_add_map
  libmultipath: check malloc return value in print_foreign_topology
  libmultipath: use map instead of dm_task_get_name
  multipathd: check MALLOC return value in mpath_pr_event_handler_fn
  libmultipathpersist: use update_multipath_table/status in get_mpvec
  multipath: use update_multipath_table/status in check_useable_paths
  multipathpersist: delete unused variable in handle_args

 kpartx/kpartx.c                 |  4 +++
 libmpathpersist/mpath_persist.c | 11 ++-----
 libmultipath/devmapper.c        |  2 +-
 libmultipath/dmparser.c         | 18 +++++------
 libmultipath/foreign.c          |  4 +++
 libmultipath/sysfs.c            |  6 +++-
 mpathpersist/main.c             | 56 +++++++++++++++++++++++++++------
 multipath/main.c                |  9 ++----
 multipathd/cli_handlers.c       | 17 +++++++---
 multipathd/main.c               |  8 +++--
 tests/util.c                    |  2 ++
 11 files changed, 96 insertions(+), 41 deletions(-)

-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

