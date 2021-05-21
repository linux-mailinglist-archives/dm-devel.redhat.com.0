Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 069FF38E124
	for <lists+dm-devel@lfdr.de>; Mon, 24 May 2021 08:47:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-gS1C-eyWON-ssrNh2LAXRg-1; Mon, 24 May 2021 02:47:44 -0400
X-MC-Unique: gS1C-eyWON-ssrNh2LAXRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 008B0802943;
	Mon, 24 May 2021 06:47:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D764B6267F;
	Mon, 24 May 2021 06:47:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 924F45534A;
	Mon, 24 May 2021 06:47:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14LHSqdn023846 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 13:28:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 659F610AF41F; Fri, 21 May 2021 17:28:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6016810BBCD5
	for <dm-devel@redhat.com>; Fri, 21 May 2021 17:28:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 947198007AC
	for <dm-devel@redhat.com>; Fri, 21 May 2021 17:28:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-594-alz556vgN_KYC2l9r_lc1Q-1; Fri, 21 May 2021 13:28:45 -0400
X-MC-Unique: alz556vgN_KYC2l9r_lc1Q-1
Received: by mail-pj1-f53.google.com with SMTP id
	n6-20020a17090ac686b029015d2f7aeea8so7713759pjt.1; 
	Fri, 21 May 2021 10:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=B30rffgHFLYBI6xwi77IEdIESyslCgwa8HluqL6arQs=;
	b=T4PIRpY0UX7QSkcH6vHhl5+JUFOjyXZadHZRVX/zECaCJZgaWIyHAENXTZfZrQ24yd
	YmT3d9zCLOMdVniD8flC2rU6C9F1XQaujQDP6jy5La8Mi06/fMOgPnVAA0SRbmxERK4q
	NrEJSc/Kyn0IlKm4tQ0VNKeFkcQ4G6IH2bUo2ZXAaaKRDbgRJuRsuBHFGKG4os3uLdcI
	1hZ1h2cTW2If+OMWSviYNwOZHuZiOsYQz3XIauJ4lrPymjncXyIcWIBqyDubMIMv5gLh
	niMDmqq0VwxcUPUyODNSxjeagzA3IcNnNkHqDMllREo/WBVHtaEHLU6dFVgs77kjKMiN
	hrPA==
X-Gm-Message-State: AOAM533l7eJ3rcdSbonzOa8NHXfiLkITfIyRVJ6e4HyRZ3wBAV0G7l7V
	j8RvxQbU2WWopDSayQfbm14=
X-Google-Smtp-Source: ABdhPJyrNWjuuiPeUt5pQpc8nPl0WeqbdGuJLCj1G2mOrwbN4glaACuKyX0vSa0sudDl68ZR50luTQ==
X-Received: by 2002:a17:902:e8c8:b029:ee:f249:e416 with SMTP id
	v8-20020a170902e8c8b02900eef249e416mr13149158plg.3.1621618124047;
	Fri, 21 May 2021 10:28:44 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
	by smtp.gmail.com with ESMTPSA id
	p19sm2008772pgi.59.2021.05.21.10.28.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 May 2021 10:28:42 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
	id 77877423A3; Fri, 21 May 2021 17:28:41 +0000 (UTC)
Date: Fri, 21 May 2021 17:28:41 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210521172841.GA25211@42.do-not-panic.com>
References: <20210521055116.1053587-1-hch@lst.de>
	<20210521055116.1053587-5-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210521055116.1053587-5-hch@lst.de>
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
X-Mailman-Approved-At: Mon, 24 May 2021 02:47:09 -0400
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Mike Snitzer <snitzer@redhat.com>, linux-m68k@vger.kernel.org,
	linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Joshua Morris <josh.h.morris@us.ibm.com>,
	linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matias Bjorling <mb@lightnvm.io>, Nitin Gupta <ngupta@vflare.org>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
	Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
	drbd-dev@tron.linbit.com, Philip Kelleher <pjk1939@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-mmc@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Jim Paris <jim@jtan.com>, Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [PATCH 04/26] block: add a flag to make put_disk on
 partially initalized disks safer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 21, 2021 at 07:50:54AM +0200, Christoph Hellwig wrote:
> Add a flag to indicate that __device_add_disk did grab a queue reference
> so that disk_release only drops it if we actually had it.  This sort
> out one of the major pitfals with partially initialized gendisk that
> a lot of drivers did get wrong or still do.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

