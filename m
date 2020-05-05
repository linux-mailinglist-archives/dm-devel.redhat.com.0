Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B791A1C5F60
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 19:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588701219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P/Tsyj95ZyN+RbV4+YWboQzctytS1kH6INVu9RbkmaE=;
	b=SuSjyYWde1hI5zaLJJMr1Mfu5PZ0bu8GfkYn91EDXS1P5yvRlDqIbdroVqlTBXnI3Lf8KZ
	wjfTHCB49HGFwmRESxHi4qC+UID9fSNX8rznPveSr9sMDxN/53uRGyPwYdeyibNLmMNu+A
	Jv/E1PDYfkpa1s/DFZqZjmFo+XdG+s4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-Ex0SeCzpOM-w_kUMj4mOVw-1; Tue, 05 May 2020 13:53:37 -0400
X-MC-Unique: Ex0SeCzpOM-w_kUMj4mOVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A5E6A0BE7;
	Tue,  5 May 2020 17:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3117A5EDE5;
	Tue,  5 May 2020 17:53:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57EBB4E982;
	Tue,  5 May 2020 17:53:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045HqiUL009395 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 13:52:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3406B202B16C; Tue,  5 May 2020 17:52:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FBE92026D69
	for <dm-devel@redhat.com>; Tue,  5 May 2020 17:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DABAD106D18D
	for <dm-devel@redhat.com>; Tue,  5 May 2020 17:52:41 +0000 (UTC)
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-_4YIeil6NPC8GRgvLTgx5g-1; Tue, 05 May 2020 13:52:39 -0400
X-MC-Unique: _4YIeil6NPC8GRgvLTgx5g-1
Received: from [81.153.126.158] (helo=[192.168.1.225])
	by smtp.hosts.co.uk with esmtpa (Exim)
	(envelope-from <antlists@youngman.org.uk>)
	id 1jW1Qq-0006Ej-Em; Tue, 05 May 2020 18:32:36 +0100
To: Zhen Lei <thunder.leizhen@huawei.com>, Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, dm-devel <dm-devel@redhat.com>,
	Song Liu <song@kernel.org>, linux-raid <linux-raid@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
From: antlists <antlists@youngman.org.uk>
Message-ID: <ea522f15-991d-6f67-ba8b-9cb4954a1064@youngman.org.uk>
Date: Tue, 5 May 2020 18:32:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505115543.1660-1-thunder.leizhen@huawei.com>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045HqiUL009395
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/4] eliminate SECTOR related magic numbers
 and duplicated conversions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 05/05/2020 12:55, Zhen Lei wrote:
> When I studied the code of mm/swap, I found "1 << (PAGE_SHIFT - 9)" appears
> many times. So I try to clean up it.
> 
> 1. Replace "1 << (PAGE_SHIFT - 9)" or similar with SECTORS_PER_PAGE
> 2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
> 3. Replace "9" with SECTOR_SHIFT
> 4. Replace "512" with SECTOR_SIZE

Naive question - what is happening about 4096-byte sectors? Do we need 
to forward-plan?

Cheers,
Wol


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

