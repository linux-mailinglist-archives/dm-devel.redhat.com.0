Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBAA6254
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 09:14:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03CC885543;
	Tue,  3 Sep 2019 07:14:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC7D35D717;
	Tue,  3 Sep 2019 07:14:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFEB889CF;
	Tue,  3 Sep 2019 07:13:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x837DoYA026377 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 03:13:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B7375D721; Tue,  3 Sep 2019 07:13:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8AA15D717;
	Tue,  3 Sep 2019 07:13:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44C8110C696A;
	Tue,  3 Sep 2019 07:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LfXrvAJ7nQoeTC4iaVaz4jsSr8XCOc8hcyp+iKwf00M=;
	b=eOf6lWVqK21zIHGXt/TWiBnTs
	+fN6KCAkxPGpd9nxtFWJ/3assrkapeFAG3RV6G3fABwRmkOq3H6vxIqGOIUQITnkGuFrZjIc1bTmk
	3ehnqfXXcmhzDv7Yw8kBQtAbEyg0MpGXuMFCWIQ2ykiCy7AlIKoDQ8N41s9WVF7P/HQioY+E/agjp
	4L3cJUF2FN2YUXDXfI9JrrapycrScQxn+ub0uduaH5wedj2Aqk/ZaDtqRbgx5YmtdvoBNtqwHxO07
	pmlE3Q+9vWr5fDwa9Mp+I2tr//6Za09Mi4KK4quscbv04fHs+GJ56v0HrHEHmG5e0NlUFYxi/W5tH
	KICr3qrOg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=noisy.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1i530L-0000jr-Cj; Tue, 03 Sep 2019 07:13:30 +0000
Received: from hirez.programming.kicks-ass.net
	(hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4EDE8306010;
	Tue,  3 Sep 2019 09:12:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 594B529B9FF5D; Tue,  3 Sep 2019 09:13:26 +0200 (CEST)
Date: Tue, 3 Sep 2019 09:13:26 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20190903071326.GV2369@hirez.programming.kicks-ass.net>
References: <20190902210558.GA23013@avx2>
	<20190903065155.GA28322@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903065155.GA28322@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Tue, 03 Sep 2019 07:13:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Tue, 03 Sep 2019 07:13:44 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'peterz@infradead.org' RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org <peterz@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: aarcange@redhat.com, rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mingo@redhat.com, axboe@kernel.dk, Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [dm-devel] [PATCH] sched: make struct task_struct::state 32-bit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 03 Sep 2019 07:14:06 +0000 (UTC)

On Mon, Sep 02, 2019 at 11:51:55PM -0700, Christoph Hellwig wrote:
> On Tue, Sep 03, 2019 at 12:05:58AM +0300, Alexey Dobriyan wrote:
> > 32-bit accesses are shorter than 64-bit accesses on x86_64.
> > Nothing uses 64-bitness of ->state.
> > 
> > Space savings are ~2KB on F30 kernel config.
> 
> I guess we'd save even more when moving from a volatile to
> WRITE_ONCE/READ_ONCE..

I doubt it; pretty much all accesses really should be using that.

Not saying we shouldn't maybe do that; but that's going to be massive
churn.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
