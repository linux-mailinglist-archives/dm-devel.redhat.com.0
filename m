Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD862E87
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 05:17:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1EFE80F98;
	Tue,  9 Jul 2019 03:17:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFC083FA6;
	Tue,  9 Jul 2019 03:17:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58CB54EBC5;
	Tue,  9 Jul 2019 03:16:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x693GTF3012944 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 23:16:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB9C65C559; Tue,  9 Jul 2019 03:16:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B63175C64D
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 03:16:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C5C481F35
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 03:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z+1t4dR8Ipfi7tN4FnyiwGEuOyViWayD6MxgR0aDK+Y=;
	b=nyD6lSE3/RhzVYvlOjYCwbHl0
	WBxCkXCa9/Pv/zYAbFGV2dCKnqz/9cNEdBl2R8r0rPCwgi/2FWK56jY5J7/HEpPMidH+35seQJf45
	Jm0s9ReIP5atf/T3E5Po1QeTlP0m+V3hdaBwcQl7gNCz6B/vHF/K0dUJ5Be760JyW4IkE9TZ68EvA
	X70J1b6BlmpwXlnB1JoiJnaZlE61d8iaHFuEiBQshM8aXKPKsXm3SSZ7NkVPhH1n8BNGHHtS4OOUQ
	IhLtlNV3O+cgpwQfBQD0MXPzy8l+7CGg2bz+YUi0vBuDD7qYN0raYoMt/lFqDRJye3Ilu1TkY1bbt
	gs7xGbmDw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hkgAR-0005p0-AV; Tue, 09 Jul 2019 02:47:43 +0000
Date: Mon, 8 Jul 2019 19:47:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20190709024742.GA22293@infradead.org>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708213551.26349-1-petr.vorel@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Delayed for 00:28:07 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Tue, 09 Jul 2019 03:16:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 09 Jul 2019 03:16:08 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+bec926e348f386e4ec5b+5798+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+bec926e348f386e4ec5b+5798+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/1] kpartx: Use __kernel_daddr_t for
 solaris_x86_slice.s_start
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 09 Jul 2019 03:17:07 +0000 (UTC)

> -//typedef int daddr_t;		/* or long - check */
> -
>  struct solaris_x86_slice {
>  	unsigned short	s_tag;		/* ID tag of partition */
>  	unsigned short	s_flag;		/* permission flags */
> -	long		s_start;	/* start sector no of partition */
> +	__kernel_daddr_t s_start;	/* start sector no of partition */
>  	long		s_size;		/* # of blocks in partition */
>  };

What this really should use is fixed size types.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
