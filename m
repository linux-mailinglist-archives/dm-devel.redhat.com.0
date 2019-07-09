Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A563298
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 10:04:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCCC1C0578C4;
	Tue,  9 Jul 2019 08:03:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3261492D3D;
	Tue,  9 Jul 2019 08:03:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21D1A4EBC0;
	Tue,  9 Jul 2019 08:03:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6982Yxv002855 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 04:02:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 764275DA63; Tue,  9 Jul 2019 08:02:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E2D5DA60
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 08:02:32 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CA313092669
	for <dm-devel@redhat.com>; Tue,  9 Jul 2019 08:02:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m4so9046943pgk.0
	for <dm-devel@redhat.com>; Tue, 09 Jul 2019 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SbsDuqHCX/2b16ICBA9gdwFrQip7JA8CqecEVIOzJdc=;
	b=Um/SFNQKyG6eeh6QN5AN6rhg3QQ0Ig3/c2oaJBVcGpfZVwJEG+0P6IHb2ZGopldyDH
	xJtJYCf2OCV/ohMiK08h5i+fcjN00OkKFNc8gibZFjha+vOFmcrOoBYP38+LUaIVpo2d
	mlgQ4TZDsz8diOMT32lTWuGjcOX34NCYM3qR+5vTYABO1NNycC9CKHZEqKwDSpnCUI6u
	8d+pEpnjBwOgWDaoY61svqhb+UQxv3CCCRDSN2JdR4oJws5bHazIe2JYde8UdWNxvPOm
	AAgRJE18Y3+iJDMyFLvRt8tqgRAPhbR99DViqAlz3nlNYear+i0rVC79AQclslMqJ5bV
	RjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SbsDuqHCX/2b16ICBA9gdwFrQip7JA8CqecEVIOzJdc=;
	b=to3FrShS/4nS0eeBBCJsEOhV2IEEcJtWjkW4xul8BIblVhGRttDjYmFvt3WIxqipDM
	dPFvatDZeqsHEtlhR6MIe0spyhrOA+GsFJZR0mtdiQhidhC10pgj6FGnSvjjIJrpdCMF
	Zf5+GNfTp/CXfrVYKIzn8FP4h8fFyapP5cVpAlNbmehTTUYEs5zMYlI9LvizorkP9O+u
	YZyPek2EEroWdvrvL9cjeDKE2UaCOLE4ZqOPgt1it9dKRCtGcoWmDGqSApoQXNpG7V5Q
	iB2B0XX2kedA9xZj70NfXFV0MUw1YNISyarA5g3Iba8oKTtr7JjkE36p8DETi+LXheT6
	MW4w==
X-Gm-Message-State: APjAAAViNdrkYkLGxvWHztmkkNjiTleCpus+C7+cuE1KKnJ48f82prhN
	XWd2detBwXk1W37Iept4IxVRFu6I
X-Google-Smtp-Source: APXvYqygnlfG/tejTqXRBJH9R0C62oW0zOQEGqXWb1YtbCfXoq+/O9Xt2apl+KYSQVVkSjwnz3z5tQ==
X-Received: by 2002:a63:5d45:: with SMTP id o5mr29388206pgm.40.1562659324659; 
	Tue, 09 Jul 2019 01:02:04 -0700 (PDT)
Received: from dell5510 (gw.ms-free.net. [95.85.240.250])
	by smtp.gmail.com with ESMTPSA id
	w197sm25794665pfd.41.2019.07.09.01.02.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 01:02:04 -0700 (PDT)
Date: Tue, 9 Jul 2019 10:02:05 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20190709080204.GA12875@dell5510>
References: <20190708213551.26349-1-petr.vorel@gmail.com>
	<20190709024742.GA22293@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190709024742.GA22293@infradead.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 09 Jul 2019 08:02:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 09 Jul 2019 08:02:10 +0000 (UTC) for IP:'209.85.215.196'
	DOMAIN:'mail-pg1-f196.google.com'
	HELO:'mail-pg1-f196.google.com' FROM:'petr.vorel@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.198 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE) 209.85.215.196 mail-pg1-f196.google.com 209.85.215.196
	mail-pg1-f196.google.com <petr.vorel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 09 Jul 2019 08:04:32 +0000 (UTC)

Hi Christoph,

> > -//typedef int daddr_t;		/* or long - check */
> > -
> >  struct solaris_x86_slice {
> >  	unsigned short	s_tag;		/* ID tag of partition */
> >  	unsigned short	s_flag;		/* permission flags */
> > -	long		s_start;	/* start sector no of partition */
> > +	__kernel_daddr_t s_start;	/* start sector no of partition */
> >  	long		s_size;		/* # of blocks in partition */
> >  };

> What this really should use is fixed size types.
If it's not specific to __kernel_daddr_t nor daddr_t ("The type of a disk
address") and long is sufficient for all platforms, that's even better.

I'd be just for removing typedef int daddr_t comment.

BTW gpart also uses struct solaris_x86_slice, with daddr_t [1].
I've filed a PR [2], but I guess I'll change it to long.

Kind regards,
Petr

[1] https://github.com/baruch/gpart/blob/master/src/gm_s86dl.h#L43
[2] https://github.com/baruch/gpart/pull/15

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
