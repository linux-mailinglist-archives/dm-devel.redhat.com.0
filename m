Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2238E298961
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 10:24:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-BlDbXx0VNZGkpWBAFtfO1A-1; Mon, 26 Oct 2020 05:24:19 -0400
X-MC-Unique: BlDbXx0VNZGkpWBAFtfO1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC4FA1882FA7;
	Mon, 26 Oct 2020 09:24:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40DA560C07;
	Mon, 26 Oct 2020 09:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC7F71833002;
	Mon, 26 Oct 2020 09:24:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09Q9No0o001449 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 05:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 296002EFB1; Mon, 26 Oct 2020 09:23:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F8D30BAD
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 09:23:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E5218007A4
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 09:23:48 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-292-3_pi3874PUmalADvZM0ubg-1; Mon, 26 Oct 2020 05:23:43 -0400
X-MC-Unique: 3_pi3874PUmalADvZM0ubg-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CKTsq69l5zhbsc;
	Mon, 26 Oct 2020 17:23:43 +0800 (CST)
Received: from [10.174.178.210] (10.174.178.210) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 26 Oct 2020 17:23:27 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Message-ID: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
Date: Mon, 26 Oct 2020 17:23:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.210]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 0/6] multipath-tools history bug in 0.4.9
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
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

There are some old patches in our multipath-tools code. They fix some
bugs in old version (0.4.9). I'm not the auther of these patches,
but I send them. Please review.Thanks.

lixiaokeng (3):
  fix multipathd resize when not all sizes of paths are equal
  fix lun expansion failure when there is offline path
  flush and sync before reboot

sunguoshuai (3):
  check pgp to avoid NULL dereference in enable_group
  fix change reservtion key to uint8 for memcmp
  ignore for clear mismatch key

 libmpathpersist/mpath_persist.c  | 27 ++++++++++++++++++++-------
 libmultipath/configure.c         | 18 ++++++++++++++++++
 libmultipath/prioritizers/alua.c |  4 ++++
 libmultipath/prioritizers/emc.c  |  2 +-
 libmultipath/prioritizers/hds.c  | 19 +++++++++++--------
 libmultipath/structs.c           |  1 +
 libmultipath/structs.h           |  1 +
 libmultipath/structs_vec.c       | 10 +++++++---
 libmultipath/util.c              |  7 +++++++
 multipathd/cli_handlers.c        | 19 ++++++++++++++++++-
 multipathd/main.c                |  5 +++++
 11 files changed, 93 insertions(+), 20 deletions(-)

-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

