Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7EB1308767
	for <lists+dm-devel@lfdr.de>; Fri, 29 Jan 2021 10:37:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-dE_Uk1y9OsGAe2BUs_a0RQ-1; Fri, 29 Jan 2021 04:37:42 -0500
X-MC-Unique: dE_Uk1y9OsGAe2BUs_a0RQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81F77801AB0;
	Fri, 29 Jan 2021 09:37:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 601E860BFA;
	Fri, 29 Jan 2021 09:37:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC0EE1809CA2;
	Fri, 29 Jan 2021 09:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10T1MN7J011977 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 20:22:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A2C210D16B1; Fri, 29 Jan 2021 01:22:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 166B710D16B0
	for <dm-devel@redhat.com>; Fri, 29 Jan 2021 01:22:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4ACE1875040
	for <dm-devel@redhat.com>; Fri, 29 Jan 2021 01:22:20 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-GKR8-Y4JPMyy1rUsh-MPDQ-1; Thu, 28 Jan 2021 20:22:18 -0500
X-MC-Unique: GKR8-Y4JPMyy1rUsh-MPDQ-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DRfFy4p1VzlCJD;
	Fri, 29 Jan 2021 09:02:46 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
	(10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0;
	Fri, 29 Jan 2021 09:04:19 +0800
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Song Liu
	<song@kernel.org>
References: <20210126145247.1964410-1-hch@lst.de>
	<20210126145247.1964410-9-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3301f2da-60c5-79ca-ab3b-0fe3345f0731@huawei.com>
Date: Fri, 29 Jan 2021 09:04:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210126145247.1964410-9-hch@lst.de>
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 29 Jan 2021 04:33:26 -0500
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	drbd-dev@tron.linbit.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Coly Li <colyli@suse.de>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] [f2fs-dev] [PATCH 08/17] f2fs: remove FAULT_ALLOC_BIO
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
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 2021/1/26 22:52, Christoph Hellwig wrote:
> Sleeping bio allocations do not fail, which means that injecting an error
> into sleeping bio allocations is a little silly.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

