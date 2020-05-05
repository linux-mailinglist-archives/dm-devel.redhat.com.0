Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2EEE1C6340
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714875;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4umPL8NrLSCt5/rd3Z1VhpcdZtR2r7xcjKl7JuXY6wg=;
	b=OQvnpahPWqBEeftTVwzT0SKKu/nONgP/DOyrc3MBTfKdGA8qV1ddYdy7nh8xvcW1CUVaiM
	n7XBexNHV/AqUsJPiJNyA4cE5ZKGmzRVRgdNIYmqjMpNKMzEZoX+6p/Cox3+QxsXh2o3a4
	hX7S0/iFnHWUK0PlBdYxKRDiVNkTO8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-moLbTCAnN-yLMe7uNcg5qw-1; Tue, 05 May 2020 17:41:13 -0400
X-MC-Unique: moLbTCAnN-yLMe7uNcg5qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96F9C108BD11;
	Tue,  5 May 2020 21:41:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9CF5C221;
	Tue,  5 May 2020 21:41:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CA96180954D;
	Tue,  5 May 2020 21:41:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045I1SQI010265 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 14:01:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27BE12157F26; Tue,  5 May 2020 18:01:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F532156A3A
	for <dm-devel@redhat.com>; Tue,  5 May 2020 18:01:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5FF7882974
	for <dm-devel@redhat.com>; Tue,  5 May 2020 18:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-386-XavfMyAHNm-6toTTjrh0RQ-1; Tue, 05 May 2020 14:01:24 -0400
X-MC-Unique: XavfMyAHNm-6toTTjrh0RQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jW1sX-00012x-Mg; Tue, 05 May 2020 18:01:13 +0000
Date: Tue, 5 May 2020 11:01:13 -0700
From: Matthew Wilcox <willy@infradead.org>
To: antlists <antlists@youngman.org.uk>
Message-ID: <20200505180113.GJ16070@bombadil.infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<ea522f15-991d-6f67-ba8b-9cb4954a1064@youngman.org.uk>
MIME-Version: 1.0
In-Reply-To: <ea522f15-991d-6f67-ba8b-9cb4954a1064@youngman.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045I1SQI010265
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>, Nitin Gupta <ngupta@vflare.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 05, 2020 at 06:32:36PM +0100, antlists wrote:
> On 05/05/2020 12:55, Zhen Lei wrote:
> > When I studied the code of mm/swap, I found "1 << (PAGE_SHIFT - 9)" appears
> > many times. So I try to clean up it.
> > 
> > 1. Replace "1 << (PAGE_SHIFT - 9)" or similar with SECTORS_PER_PAGE
> > 2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
> > 3. Replace "9" with SECTOR_SHIFT
> > 4. Replace "512" with SECTOR_SIZE
> 
> Naive question - what is happening about 4096-byte sectors? Do we need to
> forward-plan?

They're fully supported already, but Linux defines a sector to be 512
bytes.  So we multiply by 8 and divide by 8 a few times unnecessarily,
but it's not worth making sector size be a per-device property.

Good thought, though.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

