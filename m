Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 091C2269D80
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 06:40:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-CjA6Eim7OF-h4JNoAvKPZw-1; Tue, 15 Sep 2020 00:40:44 -0400
X-MC-Unique: CjA6Eim7OF-h4JNoAvKPZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6E6425E2;
	Tue, 15 Sep 2020 04:40:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9625DA90;
	Tue, 15 Sep 2020 04:40:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1CEC44A51;
	Tue, 15 Sep 2020 04:40:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F4cmYB032208 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 00:38:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA234B3033; Tue, 15 Sep 2020 04:38:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3AD2B34E6
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:38:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDEBE800161
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 04:38:45 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-XdIu74LIOCqM72UFwNmjew-1; Tue, 15 Sep 2020 00:38:40 -0400
X-MC-Unique: XdIu74LIOCqM72UFwNmjew-1
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 2E418E989C9C0708D600;
	Tue, 15 Sep 2020 12:38:34 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 15 Sep 2020 12:38:27 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
Date: Tue, 15 Sep 2020 12:38:27 +0800
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 0/6] libmultipath: check udev* func return value
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Hi,
  The udev* function may return NULL,and it will be
dereferenced in str* and sscanf func. For example,
there is a coredump caused in add func, which show in
be7a043(commit id) in upstream-queue. We check the
return value to avoid dereference NULL.

repo: openSUSE/multipath-tools
repo link: https://github.com/openSUSE/multipath-tools
branch: upstream-queue

lixiaokeng (6):
  libmultipath: check uedv* return value in sysfs_get_host_pci_name
  libmultipath: check udev* return value in ccw_sysfs_pathinfo
  libmultipath: check udev* return value in sysfs_get_tgt_nodename
  libmultipath: check udev* return value in
    trigger_partitions_udev_change
  libmultipath: check udev* renturn value in get_ctrl_blkdev
  libmultipath: check udev* return value in _find_path_by_syspath

 libmultipath/configure.c    |  4 +++-
 libmultipath/discovery.c    |  9 +++++++--
 libmultipath/foreign/nvme.c | 10 +++++++---
 3 files changed, 17 insertions(+), 6 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

