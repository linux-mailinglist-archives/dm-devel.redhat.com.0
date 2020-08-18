Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B5DA924858A
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 15:00:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-zONcI262OYW37JdvAo_02Q-1; Tue, 18 Aug 2020 09:00:14 -0400
X-MC-Unique: zONcI262OYW37JdvAo_02Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B30418B9ECB;
	Tue, 18 Aug 2020 13:00:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6A077A3B7;
	Tue, 18 Aug 2020 13:00:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4886560364;
	Tue, 18 Aug 2020 12:59:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ICxcJ9022903 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 08:59:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DA5D1006199; Tue, 18 Aug 2020 12:59:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29B93111029C
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 12:59:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6AD38117B1
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 12:59:35 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-rGqERTv_NDuupyidbFjORQ-1; Tue, 18 Aug 2020 08:59:31 -0400
X-MC-Unique: rGqERTv_NDuupyidbFjORQ-1
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 1708E8214C8DEF43276E;
	Tue, 18 Aug 2020 20:59:26 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Tue, 18 Aug 2020
	20:59:15 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
Date: Tue, 18 Aug 2020 20:59:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH 0/5] multipath-tools series: coredump and memory
	leak bugfix
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When I learn the multipath-tools source code and test it, I
find some bugs and fix them.

repo: openSUSE/multipath-tools
repo link: https://github.com/openSUSE/multipath-tools
branch: upstream-queue

lixiaokeng (5):
  libmultipath: fix a memory leak in set_ble_device
  libmultipath: fix NULL dereference in select_action
  multipathd: add reclear_pp_from_mpp in ev_remove_path
  multipathd: disable queueing for recreated map in uev_remove_map
  libmultipath: fix daemon memory leak in disassemble_map

 libmultipath/blacklist.c | 79 +++++++++++++++++++++-------------------
 libmultipath/blacklist.h |  4 +-
 libmultipath/configure.c | 30 +++++++++++----
 libmultipath/dmparser.c  | 14 ++++++-
 multipathd/main.c        | 28 ++++++++++++++
 tests/blacklist.c        | 31 +++++++---------
 6 files changed, 119 insertions(+), 67 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

