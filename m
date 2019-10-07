Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59FCE9EF
	for <lists+dm-devel@lfdr.de>; Mon,  7 Oct 2019 18:58:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8777A308FC4E;
	Mon,  7 Oct 2019 16:58:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB7E60127;
	Mon,  7 Oct 2019 16:58:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EE5D4E58A;
	Mon,  7 Oct 2019 16:58:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x97GvaxN029767 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Oct 2019 12:57:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F38BD60606; Mon,  7 Oct 2019 16:57:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF15160A9F
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 16:57:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3501F10F2E84
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wF+jVbFgRZIj/nPc4BuQeZCqmZEussckI5ecfUXORjY=;
	b=ZaevHKjw7cwPI8SZs2zZ5RLyj
	y7JsihU/pHXgIGnrGWzRiIf8S/llhQPuI8x6mdAYM7a6zNUkk3tGmQBBox88W5IfJZu7TIs806K36
	tZfObkdPE+MR+PxesfYZyFpoZRwoETKPUfhOdSISc1FgzZI3/kEN1onEL9X2Ctff3In2j5bsd3WAW
	UTSfBgsquz/hWbeBeLOdpGg6kmAxYFittbIr/zjoIWQ75Qg2pSuCvgg5HYtic3zH+jWHYtSxUb0BZ
	4EUgBbV8vVCSbY2n0eMK1ay1Ly+Ly8hpQb1K5AGCHF+WTYp2awjiBmriGXbzI7kCx8sTD4g7YgDLb
	FS+eUBv0Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
	Hat Linux)) id 1iHWKC-0001KG-Ee; Mon, 07 Oct 2019 16:57:32 +0000
Date: Mon, 7 Oct 2019 09:57:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20191007165732.GA4805@infradead.org>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
	<20190709080204.GA12875@dell5510>
	<20190709133436.GA2231@infradead.org> <20191002060508.GA16684@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002060508.GA16684@x230>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Mon, 07 Oct 2019 16:57:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Mon, 07 Oct 2019 16:57:33 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+57e919ea0ac491f15d1e+5888+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+57e919ea0ac491f15d1e+5888+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 07 Oct 2019 16:58:25 +0000 (UTC)

On Wed, Oct 02, 2019 at 08:05:09AM +0200, Petr Vorel wrote:
> I tried to search in [1], with not much success, I don't know the original name
> of the struct and struct members are quite similar. Do you have a tip, where it
> could be or would you dare to search?

No, I don't know Solaris very well.

> 
> Christophe already merged my patch as
> 129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start")
> 
> But, according to your comments it looks to me better to use the exact structure
> kernel uses. So, if we don't find anything, I'd be for using kernel struct.

Thanks, that would be great.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
