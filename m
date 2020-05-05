Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E82A71C633F
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714874;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FOS97NiSGFeF0dE86Go1glhXtUvmpli3jFasXlpdTVw=;
	b=TltwX24Okj7D3CWPB6R1ioR8C1Ugnr0FIq+HDHkVJqI0hG6HJw1W8RYp2nxmMlp/4H2qch
	I3zhk/4RLvioHo6xBKo9Xqa7uKPYvrbWcZs3r7b7mEhh8HDeZcKFUQ3M3EnvoyQ7i6Esn6
	dWFc3cF3ExuHFpQaZvSL/Q9JkCx0vlk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-U_HEBSDSNPGyDuoyw9fyKg-1; Tue, 05 May 2020 17:41:11 -0400
X-MC-Unique: U_HEBSDSNPGyDuoyw9fyKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5E31108BD10;
	Tue,  5 May 2020 21:41:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E7A26169;
	Tue,  5 May 2020 21:41:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AF90180954D;
	Tue,  5 May 2020 21:41:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045HPY9X006249 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 13:25:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50D882156A22; Tue,  5 May 2020 17:25:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D3EC2166B27
	for <dm-devel@redhat.com>; Tue,  5 May 2020 17:25:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082951049883
	for <dm-devel@redhat.com>; Tue,  5 May 2020 17:25:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-50-kp6Wj9quPfSbIj3ledqaNA-1; Tue, 05 May 2020 13:25:27 -0400
X-MC-Unique: kp6Wj9quPfSbIj3ledqaNA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jW1Jo-00088X-Tj; Tue, 05 May 2020 17:25:20 +0000
Date: Tue, 5 May 2020 10:25:20 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20200505172520.GI16070@bombadil.infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<20200505115543.1660-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200505115543.1660-3-thunder.leizhen@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045HPY9X006249
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH 2/4] mm/swap: use SECTORS_PER_PAGE_SHIFT to
	clean up code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 05, 2020 at 07:55:41PM +0800, Zhen Lei wrote:
> +++ b/mm/swapfile.c
> @@ -177,8 +177,8 @@ static int discard_swap(struct swap_info_struct *si)
>  
>  	/* Do not discard the swap header page! */
>  	se = first_se(si);
> -	start_block = (se->start_block + 1) << (PAGE_SHIFT - 9);
> -	nr_blocks = ((sector_t)se->nr_pages - 1) << (PAGE_SHIFT - 9);
> +	start_block = (se->start_block + 1) << SECTORS_PER_PAGE_SHIFT;
> +	nr_blocks = ((sector_t)se->nr_pages - 1) << SECTORS_PER_PAGE_SHIFT;

Thinking about this some more, wouldn't this look better?

	start_block = page_sectors(se->start_block + 1);
	nr_block = page_sectors(se->nr_pages - 1);


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

