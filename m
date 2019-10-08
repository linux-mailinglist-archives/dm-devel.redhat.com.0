Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54BCF4D8
	for <lists+dm-devel@lfdr.de>; Tue,  8 Oct 2019 10:19:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E26984E83E;
	Tue,  8 Oct 2019 08:19:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A2705D9D3;
	Tue,  8 Oct 2019 08:19:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2914018089C8;
	Tue,  8 Oct 2019 08:19:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x988Idc2012528 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Oct 2019 04:18:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD8EB60606; Tue,  8 Oct 2019 08:18:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D79D160605
	for <dm-devel@redhat.com>; Tue,  8 Oct 2019 08:18:37 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D78A5A44AF1
	for <dm-devel@redhat.com>; Tue,  8 Oct 2019 08:18:36 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id f20so14824241edv.8
	for <dm-devel@redhat.com>; Tue, 08 Oct 2019 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=nhGZh2COeE7xKfEWxitTHt/XoXiGX3XgmH5Pn7hTuSo=;
	b=uODHYD2VBvGVcLQiHG6ozbs4pRtYowzNZT6atxtpRE7tVQG8rDkq3Ke8K3Okb0cmdI
	U7JhT2YgNPQ3jHBkGt5eKZA2Sm3Gdv8m1WdMPL1EwH/gKniQdD1fkkjiVqI61TLoM4zA
	TlgTOqn5qZU1N1qjfid3bnDn/R7nOxAkZ+NdMTqh4e3ktFQv94v7i+taDlnopqS+zwWL
	achoavMm46MK82g/T+uvHKgbkKweX8+hzRYSJJPegGu4//ZHwKsmiNbt10Zv5mW1/sFd
	OVi2R7yUaSO6S+tN3VzsT+6DVvN6HHeNBr9hiI+8ztVvPGAX0Md2rP1yRRcwygaLZ269
	7R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=nhGZh2COeE7xKfEWxitTHt/XoXiGX3XgmH5Pn7hTuSo=;
	b=YE0XbqphILOx9f784q3/8+ROJ9KgehegUOZA5nfAxQsbOf5k0KO3Ew29I3AIy6OpZj
	HgnIzl2Ti46PUnZPpkvbiuNlhoIganmpYUsyghq8+H/tRw8+fm7yXYpSqnkLBV810VlY
	GkN8iezrWtjCr/lf41tBnNYZ/bMF8zvUIcFdi64zyTatUhY54pdT7hQI2/yywSvq+vXb
	rY3dgKN4L7E8PLiAesTow+mytd9WNfSoEEh/Log9mBj9VD+9trbvXYEmoo/hj8OQTdr+
	GjJEZ49vYCpi2SoxB4139qWYp7OvGwRhDuM33BMcKa9px/oB00hH2cUC12umxyB09fJ3
	inqA==
X-Gm-Message-State: APjAAAVnj3OoPuScen3bnOqD4rx7k1uQHs3FlH+xUZry8Y8DF0QjoH0y
	/U//G3ldryLLxfTAYCyH1e0=
X-Google-Smtp-Source: APXvYqyjyxvnYE9Sh6zOBoBi1rnK3utklwki0XxpGf/9jsLBYaEx9YUbsII6rzsinyxwIeDWsr4e7w==
X-Received: by 2002:a17:906:b204:: with SMTP id
	p4mr27870627ejz.185.1570522715566; 
	Tue, 08 Oct 2019 01:18:35 -0700 (PDT)
Received: from dell5510 ([178.21.189.11])
	by smtp.gmail.com with ESMTPSA id d4sm2193935ejm.24.2019.10.08.01.18.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 01:18:34 -0700 (PDT)
Date: Tue, 8 Oct 2019 10:18:32 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191008081831.GA29132@dell5510>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
	<20190709080204.GA12875@dell5510>
	<20190709133436.GA2231@infradead.org> <20191002060508.GA16684@x230>
	<20191007165732.GA4805@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007165732.GA4805@infradead.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Tue, 08 Oct 2019 08:18:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 08 Oct 2019 08:18:37 +0000 (UTC) for IP:'209.85.208.68'
	DOMAIN:'mail-ed1-f68.google.com' HELO:'mail-ed1-f68.google.com'
	FROM:'petr.vorel@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.208.68 mail-ed1-f68.google.com 209.85.208.68
	mail-ed1-f68.google.com <petr.vorel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Baruch Even <baruch@ev-en.org>
Subject: Re: [dm-devel] [PATCH 1/1] kpartx: Use __kernel_daddr_t for
 solaris_x86_slice.s_start
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Petr Vorel <petr.vorel@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 08 Oct 2019 08:19:10 +0000 (UTC)

Hi Christoph,

> On Wed, Oct 02, 2019 at 08:05:09AM +0200, Petr Vorel wrote:
> > I tried to search in [1], with not much success, I don't know the original name
> > of the struct and struct members are quite similar. Do you have a tip, where it
> > could be or would you dare to search?

> No, I don't know Solaris very well.

> > Christophe already merged my patch as
> > 129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start")

> > But, according to your comments it looks to me better to use the exact structure
> > kernel uses. So, if we don't find anything, I'd be for using kernel struct.

> Thanks, that would be great.
I've sent a patch, as RFC, Cc also Baruch Even, the gpart maintainer.
I wonder, if there is anybody actually using this code nowadays.

Kind regards,
Petr

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
