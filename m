Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3FB23EFE57
	for <lists+dm-devel@lfdr.de>; Wed, 18 Aug 2021 09:57:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-kBVkmSOWNx2-elARrNyNmQ-1; Wed, 18 Aug 2021 03:57:04 -0400
X-MC-Unique: kBVkmSOWNx2-elARrNyNmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C94FA101C8A9;
	Wed, 18 Aug 2021 07:56:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CEA519D9B;
	Wed, 18 Aug 2021 07:56:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81706181A0F9;
	Wed, 18 Aug 2021 07:56:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HEgvGH007106 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 10:42:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D3392141559; Tue, 17 Aug 2021 14:42:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52CE5200E490
	for <dm-devel@redhat.com>; Tue, 17 Aug 2021 14:42:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B5341066686
	for <dm-devel@redhat.com>; Tue, 17 Aug 2021 14:42:53 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-499-xxPovym2OlWq0PuqZkezQQ-1; Tue, 17 Aug 2021 10:42:51 -0400
X-MC-Unique: xxPovym2OlWq0PuqZkezQQ-1
Received: by mail-lf1-f47.google.com with SMTP id p38so42015932lfa.0;
	Tue, 17 Aug 2021 07:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IYqEXJfiN18yCZI6p8+AKI7fLyyfIF/2Rhy4MgWxORs=;
	b=FmPKSq9GSb5yoCWX+++MXsv+RLmlj4HaO5VAl+QTCkuBTsNP6dxiV6yvmkLytenBN5
	ItNFvnycLWTWBZFeLpWtzWuqbLVtJk4ogTLwKND5NZz/3gBLWm4UOWrSXhxyLMMG1QR0
	Q7h+gDE3UNBodXQTjkGhXbz3AZrsuXiXkRpKtKnZgobOfj/BSO8exmr2rAARf9PUbDmc
	yiwcDcYFJFQfD+JHcZl4O2ArKOK73DlAoqRUw9VqP+4EHSH3p49Dhi7nzAdhfKtjRY/T
	pj0byyF0XHypxCSCuZUVMzfIHgbQF6ZsHsxtDLNLO5VeC0r9+WpgSIycuCRFbGmWA7Iv
	xtJg==
X-Gm-Message-State: AOAM530QMnUowP5Pzuuba5g9ZTc5hwZ/Rdfvl6wxLcfYbp6EZl5HNXc4
	Y3g1h8e+0atj1HQWE+FUxWi6SkGLRkv+jbRdHnk=
X-Google-Smtp-Source: ABdhPJzaMq7CWUOoMolITqe/TuYuwS1QvR8N16pqlMH4rqZKY4UMF98ZToXGodeF25valw2giFNpcKQdBw8IOwnP8Gc=
X-Received: by 2002:ac2:5b9d:: with SMTP id o29mr2734522lfn.26.1629211368980; 
	Tue, 17 Aug 2021 07:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210817101423.12367-1-selvakuma.s1@samsung.com>
	<CGME20210817101753epcas5p4f4257f8edda27e184ecbb273b700ccbc@epcas5p4.samsung.com>
	<20210817101423.12367-3-selvakuma.s1@samsung.com>
	<YRu02+RgnZekKSqi@kroah.com>
In-Reply-To: <YRu02+RgnZekKSqi@kroah.com>
From: Nitesh Shetty <nitheshshetty@gmail.com>
Date: Tue, 17 Aug 2021 20:12:37 +0530
Message-ID: <CAOSviJ3tziyBmeP5Op_NAPhyt5vDprjPLaGH8Fu_rbK8UcQYPA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 18 Aug 2021 03:56:53 -0400
Cc: snitzer@redhat.com, djwong@kernel.org, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, hch@lst.de, agk@redhat.com,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	willy@infradead.org, nj.shetty@samsung.com, kch@kernel.org,
	SelvaKumar S <selvakuma.s1@samsung.com>, selvajove@gmail.com,
	linux-block@vger.kernel.org, mpatocka@redhat.com,
	javier.gonz@samsung.com, kbusch@kernel.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, joshi.k@samsung.com,
	martin.petersen@oracle.com, linux-api@vger.kernel.org,
	johannes.thumshirn@wdc.com, linux-fsdevel@vger.kernel.org,
	joshiiitr@gmail.com, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH 2/7] block: Introduce queue limits for
	copy-offload support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 17, 2021 at 6:38 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 17, 2021 at 03:44:18PM +0530, SelvaKumar S wrote:
> > From: Nitesh Shetty <nj.shetty@samsung.com>
> >
> > Add device limits as sysfs entries,
> >         - copy_offload (READ_WRITE)
> >         - max_copy_sectors (READ_ONLY)
> >         - max_copy_ranges_sectors (READ_ONLY)
> >         - max_copy_nr_ranges (READ_ONLY)
>
> You forgot to add Documentation/ABI/ entries for your new sysfs files,
> so we can't properly review them :(
>

Sorry, we will update the documentation in the next version.

Thanks,
Nitesh Shetty

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

