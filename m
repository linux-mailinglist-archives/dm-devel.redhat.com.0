Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F4372D5
	for <lists+dm-devel@lfdr.de>; Thu,  6 Jun 2019 13:28:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E13DF5F79B;
	Thu,  6 Jun 2019 11:28:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B922AAB7;
	Thu,  6 Jun 2019 11:28:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D286206D2;
	Thu,  6 Jun 2019 11:27:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x569RpsX025358 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Jun 2019 05:27:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9205679CB; Thu,  6 Jun 2019 09:27:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C3836726D;
	Thu,  6 Jun 2019 09:27:47 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC13F307D93E;
	Thu,  6 Jun 2019 09:27:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p11so1625180wre.7;
	Thu, 06 Jun 2019 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=U91ywhdMkGQGI1rWUGWuzywxMAyROzIgAQcdcL6gXPY=;
	b=CM8zwYbruz7kaEk84Fz7h7aKVLQGOob0uwZVhJ3EHhXCinrSbwCyuj/+5ToxvtENaY
	jVl4XOB/vXttvU1PSqf3D+F0ZCWDu13LlfdnboF3udUDRsBemSlf1hp0InJV12WS/MA3
	jA2UQ1fJ2Z6n14ERXQf8giSEQwztrM/aMkVS2+xyo1JfVWWbW0gxrEj3JkAG6v2kB564
	BvVtxsrQh5onwMjeG6rDvD/py7e6VonCImocerR2w5zdamN3yDrDXqFhQv+ama3KYey5
	AhbuzvXDJ1DPh+M5yTb7iPF9iLnNT8TgdwXQKmziI7VEcrcQPxZWIkmDpWcqM6ET/XXI
	eqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=U91ywhdMkGQGI1rWUGWuzywxMAyROzIgAQcdcL6gXPY=;
	b=AJGA6v+3vjLayUZigs6CpL3f99c3pP7qZFhAEU7g7SBDyp2joFJ6CdB+Lin5KkjmI8
	shc9qQu4Yq1oCl5BL61oE4uqKDyXrRVDu8R9yFfA5w22JoxE2CP4amSJ4c6aiNNydofi
	Uy5W0sjnZ7bdSAp/WlLpoxm03laQ229ilkmcBG5pURMU+sYRy30bGzWyHCtdcSL25ILS
	xpdf5TcFxJC0jpGszLrvKAwT7TswgseBwNk56z+zazE3LmothkW7IZSgXiQJ7mTryw5w
	lERj8yNFNgMdUZcb7CRfl4P3li4HOIRFIm9BaEctZh8awJV378b84XBqy04sigcdtXZ7
	1oRg==
X-Gm-Message-State: APjAAAXtldtmZKn6qmZME8uBczRdXS2n0IZXREGzaGIenvlF0frg9tSO
	QeRl3IlB1+GvrwGLlfREbHbXFv/c
X-Google-Smtp-Source: APXvYqy19J5e1eE29L4WFZZfy93GbyufZjIvVJC86krHXtfPLnJhP8uzDSWMEtq0COUvAd2UjFK7fw==
X-Received: by 2002:a5d:474a:: with SMTP id o10mr2462654wrs.157.1559813252343; 
	Thu, 06 Jun 2019 02:27:32 -0700 (PDT)
Received: from zhanggen-UX430UQ ([108.61.173.19])
	by smtp.gmail.com with ESMTPSA id
	f10sm1575712wrg.24.2019.06.06.02.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 02:27:31 -0700 (PDT)
Date: Thu, 6 Jun 2019 17:27:25 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190606092725.GA21792@zhanggen-UX430UQ>
References: <20190529013320.GA3307@zhanggen-UX430UQ>
	<fcf2c3c0-e479-9e74-59d5-79cd2a0bade6@acm.org>
	<20190529152443.GA4076@zhanggen-UX430UQ>
	<20190530161103.GA30026@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530161103.GA30026@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 06 Jun 2019 09:27:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 06 Jun 2019 09:27:34 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'blackgod016574@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.642 * (DKIM_ADSP_CUSTOM_MED, DKIM_INVALID, DKIM_SIGNED,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, NML_ADSP_CUSTOM_MED,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:26:12 -0400
Cc: dm-devel@redhat.com, Bart Van Assche <bvanassche@acm.org>, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] dm-init: fix 2 incorrect use of kstrndup()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 06 Jun 2019 11:28:57 +0000 (UTC)

On Thu, May 30, 2019 at 12:11:03PM -0400, Mike Snitzer wrote:
> On Wed, May 29 2019 at 11:24am -0400,
> Gen Zhang <blackgod016574@gmail.com> wrote:
> 
> > On Wed, May 29, 2019 at 05:23:53AM -0700, Bart Van Assche wrote:
> > > On 5/28/19 6:33 PM, Gen Zhang wrote:
> > > > In drivers/md/dm-init.c, kstrndup() is incorrectly used twice.
> > > > 
> > > > It should be: char *kstrndup(const char *s, size_t max, gfp_t gfp);
> > > 
> > > Should the following be added to this patch?
> > > 
> > > Fixes: 6bbc923dfcf5 ("dm: add support to directly boot to a mapped
> > > device") # v5.1.
> > > Cc: stable
> > > 
> > > Thanks,
> > > 
> > > Bart.
> > Personally, I am not quite sure about this question, because I am not 
> > the maintainer of this part.
> 
> Yes, it should have the tags Bart suggested.
> 
> I'll take care it.
> 
> Thanks,
> Mike
Hi,
Is there any updates about this patch? I want to check if it is apllied
beacause I have to write it down in my paper and the deadline is close.

Thanks
Gen

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
