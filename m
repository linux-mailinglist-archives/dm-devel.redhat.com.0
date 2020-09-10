Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC2C2650D1
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 22:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599769791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WScjwJsmhAZEnVrR5GYMq3ttuI3Rwb9K54CO625X39E=;
	b=T9AVNW4s8EZ2TaAcDP1ZDxOaXV/UiaUaEo4vrgEff/eE5kRD4kTLgklXkplG2btKiHO0AK
	xlHoBdZkpAkVb9oqiEmzSfZCrMIxe94i7+eQmHWSlFuDL5U6dpUw3R3PmNgwf4XuI7gsy1
	TfDFW3PoWK40yD5AIqTjOeyS/YO4Aeg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-MLPq-pLMPta4bInJZQ8eIw-1; Thu, 10 Sep 2020 16:29:48 -0400
X-MC-Unique: MLPq-pLMPta4bInJZQ8eIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4B76100CF6C;
	Thu, 10 Sep 2020 20:29:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F1F78439;
	Thu, 10 Sep 2020 20:29:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EE3F922F9;
	Thu, 10 Sep 2020 20:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AKTJt4028972 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 16:29:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B10A42166B27; Thu, 10 Sep 2020 20:29:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC7FD2156A23
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 20:29:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C6A618AE947
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 20:29:17 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-306-126FlViuNJ-Rb5N1ftAfSQ-1; Thu, 10 Sep 2020 16:29:16 -0400
X-MC-Unique: 126FlViuNJ-Rb5N1ftAfSQ-1
Received: by mail-ot1-f71.google.com with SMTP id m8so1750899otf.23
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 13:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IX9w0ZSjp7THQg9dmlFf36s3FmxJM6HIjwaAJlUDQm4=;
	b=pTxrHCmv2tss0qYhqXDa164W7BOYI6/FEQhSWaasvKiCpvC8qX35/CkmZOBTXpcKWn
	jT65W6JHTeR+Gm0Xf1hwtx8zAnhI5NHdh0E9QHtfeUg2j1lQS4GFfHYxY15rlgmdn0ey
	ew8CYlqdkICtVSV1M9ZqIZ76SkzNSSU7DYrQSTfqrzr9KrfFsBK4s3SOG1U2y3fD+twz
	5cn5fZd/AbHUeTJCtB6mNC6xn3scgkORNsWBrWcgw8rh0R0G37ypX9n+EUQUb2ZAB5An
	NRMzNku9nRbZpx02DlsnW5MElRJb1Tr7Owe8mkS1Q5J/hzg2TnDAIZXj6WhgUqa0K57P
	fNjQ==
X-Gm-Message-State: AOAM5326hRBqmskhrgayLRtzi/FLPMI9+v3lRqS4KzAAZZOgJpf+c0uc
	gz/acqeg68iw45fAjLmqIpyajcCFtKBc+eBzFc7es3ufwRwtB9+qpjmEMWuj1dRGM6bgIF2FvU+
	CZIsuHEG62HvpLveixwm7jMuEZDqKVwQ=
X-Received: by 2002:aca:f0d:: with SMTP id 13mr1138347oip.124.1599769755133;
	Thu, 10 Sep 2020 13:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjagZZP1DlG8twkBZt8brPitsRQEPgllvGSumjuHvcGgaTG91J1VqlKvZW8YrM3QuHJBH7viGKbpl/JTn/L68=
X-Received: by 2002:aca:f0d:: with SMTP id 13mr1138331oip.124.1599769754904;
	Thu, 10 Sep 2020 13:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200903115549.17845-1-colyli@suse.de>
	<20200903160608.GU878166@iweiny-DESK2.sc.intel.com>
	<c202e410-99af-3f15-0f76-def5fba7a83a@suse.de>
In-Reply-To: <c202e410-99af-3f15-0f76-def5fba7a83a@suse.de>
From: John Pittman <jpittman@redhat.com>
Date: Thu, 10 Sep 2020 16:29:04 -0400
Message-ID: <CA+RJvhxBHriCuJhm-D8NvJRe3h2MLM+ZMFgjeJjrRPerMRLvdg@mail.gmail.com>
To: Coly Li <colyli@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	dm-devel@redhat.com, Adrian Huang <ahuang12@lenovo.com>,
	Jan Kara <jack@suse.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH] dax: fix for do not print error message for
 non-persistent memory block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

But it should be moved prior to the two bdev_dax_pgoff() checks right?
 Else a misaligned partition on a dax unsupported block device can
print the below messages.

kernel: sda1: error: unaligned partition for dax
kernel: sda2: error: unaligned partition for dax
kernel: sda3: error: unaligned partition for dax

Reviewed-by: John Pittman <jpittman@redhat.com>

On Thu, Sep 3, 2020 at 12:12 PM Coly Li <colyli@suse.de> wrote:
>
> On 2020/9/4 00:06, Ira Weiny wrote:
> > On Thu, Sep 03, 2020 at 07:55:49PM +0800, Coly Li wrote:
> >> When calling __generic_fsdax_supported(), a dax-unsupported device may
> >> not have dax_dev as NULL, e.g. the dax related code block is not enabled
> >> by Kconfig.
> >>
> >> Therefore in __generic_fsdax_supported(), to check whether a device
> >> supports DAX or not, the following order should be performed,
> >> - If dax_dev pointer is NULL, it means the device driver explicitly
> >>   announce it doesn't support DAX. Then it is OK to directly return
> >>   false from __generic_fsdax_supported().
> >> - If dax_dev pointer is NOT NULL, it might be because the driver doesn't
> >>   support DAX and not explicitly initialize related data structure. Then
> >>   bdev_dax_supported() should be called for further check.
> >>
> >> IMHO if device driver desn't explicitly set its dax_dev pointer to NULL,
> >> this is not a bug. Calling bdev_dax_supported() makes sure they can be
> >> recognized as dax-unsupported eventually.
> >>
> >> This patch does the following change for the above purpose,
> >>     -       if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
> >>     +       if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
> >>
> >>
> >> Fixes: c2affe920b0e ("dax: do not print error message for non-persistent memory block device")
> >> Signed-off-by: Coly Li <colyli@suse.de>
> >
> > I hate to do this because I realize this is a bug which people really need
> > fixed.
> >
> > However, shouldn't we also check (!dax_dev || !bdev_dax_supported()) as the
> > _first_ check in __generic_fsdax_supported()?
> >
> > It seems like the other pr_info's could also be called when DAX is not
> > supported and we probably don't want them to be?
> >
> > Perhaps that should be a follow on patch though.  So...
>
> I am not author of c2affe920b0e, but I guess it was because
> bdev_dax_supported() needed blocksize, so blocksize should pass previous
> checks firstly to make sure bdev_dax_supported() has a correct blocksize
> to check.
>
> >
> > As a direct fix to c2affe920b0e
> >
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>
> Thanks.
>
> Coly Li
>
>
> >
> >> Cc: Adrian Huang <ahuang12@lenovo.com>
> >> Cc: Ira Weiny <ira.weiny@intel.com>
> >> Cc: Jan Kara <jack@suse.com>
> >> Cc: Mike Snitzer <snitzer@redhat.com>
> >> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> >> Cc: Vishal Verma <vishal.l.verma@intel.com>
> >> ---
> >>  drivers/dax/super.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> >> index 32642634c1bb..e5767c83ea23 100644
> >> --- a/drivers/dax/super.c
> >> +++ b/drivers/dax/super.c
> >> @@ -100,7 +100,7 @@ bool __generic_fsdax_supported(struct dax_device *dax_dev,
> >>              return false;
> >>      }
> >>
> >> -    if (!dax_dev && !bdev_dax_supported(bdev, blocksize)) {
> >> +    if (!dax_dev || !bdev_dax_supported(bdev, blocksize)) {
> >>              pr_debug("%s: error: dax unsupported by block device\n",
> >>                              bdevname(bdev, buf));
> >>              return false;
> >> --
> >> 2.26.2
> >>
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

