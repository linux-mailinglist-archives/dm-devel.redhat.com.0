Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDFF2FFEAE
	for <lists+dm-devel@lfdr.de>; Fri, 22 Jan 2021 09:51:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-yG7n3OkyNs-DXyxJGVDXJw-1; Fri, 22 Jan 2021 03:51:54 -0500
X-MC-Unique: yG7n3OkyNs-DXyxJGVDXJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB4548018A3;
	Fri, 22 Jan 2021 08:51:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6BA75D9EF;
	Fri, 22 Jan 2021 08:51:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59C59180954D;
	Fri, 22 Jan 2021 08:51:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LCEnMd029119 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 07:14:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 49071D7B39; Thu, 21 Jan 2021 12:14:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 438AFD7B38
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 12:14:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 024E41875040
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 12:14:46 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-6-_SJjcyUxPrGqNuJZj8zO2A-1;
	Thu, 21 Jan 2021 07:14:40 -0500
X-MC-Unique: _SJjcyUxPrGqNuJZj8zO2A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
	TI=SMTPD_---0UMQS2-7_1611231273
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UMQS2-7_1611231273) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 21 Jan 2021 20:14:33 +0800
To: Mike Snitzer <snitzer@redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <bd2143e1-d515-be97-a010-d4d213f090c8@linux.alibaba.com>
Date: Thu, 21 Jan 2021 20:14:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
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
X-Mailman-Approved-At: Fri, 22 Jan 2021 03:51:25 -0500
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>,
	device-mapper development <dm-devel@redhat.com>
Subject: [dm-devel] [BUG Report] -EIO error when reloading table
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, Mike,

I got "attempt to access beyond end of device
dm-0: rw=0, want=3129056, limit=2097152" error when I was reloading the
table of dm-0, while there's a background **direct** IO on dm-0 (no fs
on it, i.e., just raw device) meanwhile.

It seems that it fails bio_check_eod() in submit_bio().

But when I formatted one ext4 filesystem on dm-0, and the background IO
pressure is redirected to one file inside the ext4 filesystem, I didn't
encounter this error anymore when I reload dm-0. I think it's because
the filesystem gets frozen since lock_fs() in __dm_suspend().

So is this a known issue?


-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

