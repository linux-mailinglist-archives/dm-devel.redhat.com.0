Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9340A21E109
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 21:55:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-zSjuyyffOkuxAejxT8A1Yw-1; Mon, 13 Jul 2020 15:55:50 -0400
X-MC-Unique: zSjuyyffOkuxAejxT8A1Yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1707A8015F3;
	Mon, 13 Jul 2020 19:55:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D6260BEC;
	Mon, 13 Jul 2020 19:55:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14A23180954D;
	Mon, 13 Jul 2020 19:55:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06CLAu03013474 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Jul 2020 17:10:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2252D2029F60; Sun, 12 Jul 2020 21:10:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E04D2026D67
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 21:10:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51152833B78
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 21:10:53 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-304-0ht5FKFLPtK-VhMSSIYl9g-1; Sun, 12 Jul 2020 17:10:51 -0400
X-MC-Unique: 0ht5FKFLPtK-VhMSSIYl9g-1
Received: by mail-pf1-f195.google.com with SMTP id x72so5059518pfc.6;
	Sun, 12 Jul 2020 14:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=lUm4cLOAP9oD2S5sJi8gYSXH2QfTVX1GOTo0+hkX9Vw=;
	b=fZka1Lf8tRwXb8z918+fTyqQTV0GoI9aP522tfNvnd+YkVWqawUpE7vIZu5C5+CLJL
	aGxefX86lCbgj/kIP42kAhhzjkoLZaZtYQgUvn1ZGmT2AsSLgv5TzESkFbrhPzz0lm7Z
	khdT9eH/HDuffulIV3EbmphYsEAztO495mAcUC0/jEdL27q2p7CxN0yghg8yiV1CyWAK
	5D1wlhMURfH+LqIrnM81MxILlMQmhPdXtyTB/VsuA8MkXbQl9MM3EfLDXkyYt4LQg0/9
	0xgjM/Fg3eHPMDnynklhukHR4qOob5YoiKNyU2vTgB9kMCUA2c8cEZ+HfREsxc7o3zVB
	uLRw==
X-Gm-Message-State: AOAM533pelGqp0AkRBWrJ0Dr0La7yzY6ZY4Jo27oV2hk8M51UrHaRN+T
	/v0eNV+LPC8eOyNRTl6LI94WWgZXnpw7Tw==
X-Google-Smtp-Source: ABdhPJy3vL+y6+PJJgo91UvG6zi9x0U+Z/p1fmB+bUb9pJVVBrqWVjmhlbkhKbSU+d9auRivIZIbrA==
X-Received: by 2002:a63:c603:: with SMTP id w3mr65777252pgg.284.1594588249757; 
	Sun, 12 Jul 2020 14:10:49 -0700 (PDT)
Received: from austin-fedora (IP-168-124.cs.nctu.edu.tw. [140.113.168.124])
	by smtp.gmail.com with ESMTPSA id
	204sm12275757pfx.3.2020.07.12.14.10.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jul 2020 14:10:49 -0700 (PDT)
Date: Mon, 13 Jul 2020 05:10:45 +0800
From: Austin Chang <austin880625@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200712211045.GA332416@austin-fedora>
References: <20200712194039.329035-1-austin880625@gmail.com>
	<20200712195932.GV12769@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200712195932.GV12769@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 Jul 2020 15:55:23 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-cache: document zeroing metadata device
	step
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Jul 12, 2020 at 08:59:32PM +0100, Matthew Wilcox wrote:
> On Mon, Jul 13, 2020 at 03:40:39AM +0800, Austin Chang wrote:
> > +  # When using dmsetup directly instead of volume manager like lvm2,
> > +  # the first 4k of the metadata device should be zeroed to indicate
> > +  # empty metadata.
> > +  dd if=/dev/zero of=/dev/mapper/metadata bs=4k conv=notrunc
> 
> ... don't you need 'count=1' or you'll zero the entire device?

Oops, I copied the command I just used since zeroing the whole metadata
device didn't harm. But 'count=1' should match what I've just written.
I will send a v2 patch later

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

