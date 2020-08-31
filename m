Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEA6257889
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 13:37:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-c7CxGorRNnCMI7ki7yohjw-1; Mon, 31 Aug 2020 07:37:00 -0400
X-MC-Unique: c7CxGorRNnCMI7ki7yohjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB0581007466;
	Mon, 31 Aug 2020 11:36:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32EE5C22B;
	Mon, 31 Aug 2020 11:36:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55BF01826D2A;
	Mon, 31 Aug 2020 11:36:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VBaYNK012170 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 07:36:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 172AF110F759; Mon, 31 Aug 2020 11:36:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12444110F758
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:36:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E1BD80029D
	for <dm-devel@redhat.com>; Mon, 31 Aug 2020 11:36:31 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-575-hHy-b6pnOAOHjWu0zEAvsQ-1; Mon, 31 Aug 2020 07:36:26 -0400
X-MC-Unique: hHy-b6pnOAOHjWu0zEAvsQ-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id B95F3C1C4E1C830133BD;
	Mon, 31 Aug 2020 19:36:22 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 31 Aug 2020 19:36:16 +0800
To: Martin Wilck <mwilck@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <50b2333d-8c5d-8705-a31a-11bb84980373@huawei.com>
Date: Mon, 31 Aug 2020 19:36:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
X-Originating-IP: [10.174.179.249]
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
Cc: lixiaokeng <lixiaokeng@huawei.com>, yanxiaodan@huawei.com,
	linfeilong <linfeilong@huawei.com>, dm-devel@redhat.com,
	zkabelac@redhat.com, liuzhiqiang26@huawei.com
Subject: [dm-devel] [PATCH V4 0/5] multipath-tools series: some cleanups and
	fixes
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US


When I learn and review the multipath-tools source code, I find
some cleanups and fixes.

V3->V4:
[PATCH V4 2/5] multipathd: use daemon_status_msg to construct sd notify msg
in do_sd_notify func
-- put "STATUS=" in format string to avoid "prefix" var as suggested by
Martin.


V2->V3:
[PATCH V3 1/5] multipathd: adopt static char* arr in daemon_status
  - add default case in sd_notify_status to fix compile error
[PATCH V3 2/5] multipathd: use daemon_status_msg to construct sd notify
  - set MSG_SIZE to 32 and use safe_sprintf as suggested by Martin.

V1->V2:
- rewrite some patches as suggested by Martin.

repo: openSUSE/multipath-tools
repo link: https://github.com/openSUSE/multipath-tools
branch: upstream-queue

ZhiqiangLiu (2):
  multipathd: adopt static char* arr in daemon_status
  multipathd: use daemon_status_msg to construct sd notify msg in
    do_sd_notify func

 multipathd/main.c | 62 +++++++++++++++++++++--------------------------
 multipathd/main.h |  3 ++-
 2 files changed, 29 insertions(+), 36 deletions(-)

-- 
2.24.0.windows.2



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

