Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 058791094BE
	for <lists+dm-devel@lfdr.de>; Mon, 25 Nov 2019 21:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574714601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TS+fYXRNP1Bg7va70KcGkDHnriSaE1ymSrFAxgk3jUw=;
	b=WUpFsEir4kqdUptF2LDVkliHrLevNz+NYv/mzjSoIdh29lHGjwZwXVyzVt7rd8IAm7Kak0
	6QoLlfBz+NxZfk1fmFmnBTBieUunCMO3GmKTCUWKcqcveOh6ebvp7EeI0EebOWBEqXwWuR
	xtIJMID8eDj+fGX9et8NOVdOU7Bphhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Wm4cqrBmOM2qcXfLaDT8BQ-1; Mon, 25 Nov 2019 15:43:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 586288051E2;
	Mon, 25 Nov 2019 20:43:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA57B5D9CA;
	Mon, 25 Nov 2019 20:43:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C627E4BB5C;
	Mon, 25 Nov 2019 20:42:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPKgmbU001838 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 15:42:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CFCDF10ABCAB; Mon, 25 Nov 2019 20:42:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA8B210ABC97
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 20:42:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DD611024D12
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 20:42:46 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-TKVwyEjhPGiQ75F7LyQoHA-1; Mon, 25 Nov 2019 15:42:43 -0500
Received: by mail-io1-f48.google.com with SMTP id k13so17812298ioa.9
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 12:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=GYt1Ms2Fpapcb2SfQ350QLztV93YMChNbsnl6+AAf18=;
	b=JdkGOh6ma9mccWGetYTb5bBNwQaHPynfYt5UzzvxGjXRdmlJ9KkGKN3xGrJXtIWAH3
	i2cUpYoGX17ZVnaIQAdcqWWn8vBuslSNENRVY3bfUH8lcb6ypW60llL+CzDlAvANiyVr
	r0ME6Tp68N/iOCH6Zu8OchkDkbpV+rL+TqnIU62RkhLglSv9ojHcpXhmre/iX5wxJEiz
	tmSS+ryy9zE5SsYV56A2d7zWYvxEf8Ols7G/CEUgjy+DNwj4zokiquLhpPjMxCqjs+CF
	cLgM9PZE0GloSryRvA8PtRNRC2QiEtTZUU/jqPiOANqUOfftUNj4an2Fgy/GMYPMrC+R
	rU8w==
X-Gm-Message-State: APjAAAWyxPaDkvyZwXFthLldBPHCgLTCOojwUm0YdFIyk/jleol1ICky
	/QG34BxKpN8JzgfMu8DCQL9CfnfB/2w4Nd5LNjOEUp/PVzY=
X-Google-Smtp-Source: APXvYqxzyUX0BsaaVcfGkzKxr+NqXAS8nY5UwAVryAXsCMvLXRL64qbIBrg1+11uMjDIhWqILCyhJL+kz7dF29NqSZU=
X-Received: by 2002:a5d:9351:: with SMTP id i17mr26857501ioo.297.1574714561832;
	Mon, 25 Nov 2019 12:42:41 -0800 (PST)
MIME-Version: 1.0
References: <CAN-y+EJOt=MRDEXCx9_U4zmDs+i9yXj364E4+z=xC=u8+Ao1PQ@mail.gmail.com>
	<329fd408ea605f1f14c0eebb46209fd3c46c3af8.camel@suse.de>
In-Reply-To: <329fd408ea605f1f14c0eebb46209fd3c46c3af8.camel@suse.de>
From: Drew Hastings <dhastings@crucialwebhost.com>
Date: Mon, 25 Nov 2019 13:42:30 -0700
Message-ID: <CAN-y+E+65bgiUSL6VMvRJLd3AiqD7xApbm1nA69ue_M6tTsGrA@mail.gmail.com>
To: Martin Wilck <mwilck@suse.de>, dm-devel@redhat.com
X-MC-Unique: TKVwyEjhPGiQ75F7LyQoHA-1
X-MC-Unique: Wm4cqrBmOM2qcXfLaDT8BQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] multipath - unable to use multiple active paths at
 once, and deprecated example in docs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============1772977514116751290=="

--===============1772977514116751290==
Content-Type: multipart/alternative; boundary="00000000000014c4cb059831ce1b"

--00000000000014c4cb059831ce1b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 12:48 PM Martin Wilck <mwilck@suse.de> wrote:

>
> I think you are seeing this FIXME:
>
> https://elixir.bootlin.com/linux/v4.19.79/source/drivers/md/dm-mpath.c#L6=
12
>
> For your testing, perhaps you just remove that if(!pgpath) condition.
>
> Regards,
> Martin
>

That's correct, thanks. It works as expected after removing that condition.

With some limited testing using fio, I don't see any obvious negative
impacts of allowing choose_pgpath to run each bio mapping. I also don't see
any significant increase in CPU usage or IO latency during benchmarking.

The FIXME comment acknowledges that this sort of defeats the balancing
function of multipath, so I'm assuming this was removed for a good reason.
Does anyone know why this was done? In my particular use case, I benefit
from balancing the paths for throughput, so it's useful to me.

Thanks!
- Drew

--00000000000014c4cb059831ce1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 25, 2019=
 at 12:48 PM Martin Wilck &lt;<a href=3D"mailto:mwilck@suse.de">mwilck@suse=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
I think you are seeing this FIXME:<br>
<br>
<a href=3D"https://elixir.bootlin.com/linux/v4.19.79/source/drivers/md/dm-m=
path.c#L612" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin.co=
m/linux/v4.19.79/source/drivers/md/dm-mpath.c#L612</a><br>
<br>
For your testing, perhaps you just remove that if(!pgpath) condition.<br>
<br>
Regards,<br>
Martin<br></blockquote><br>That&#39;s correct, thanks. It works as expected=
 after removing that condition.<br><br>With some limited testing using fio,=
 I don&#39;t see any obvious negative impacts of allowing=C2=A0choose_pgpat=
h to run each bio mapping. I also don&#39;t see any significant increase in=
 CPU usage or IO latency during benchmarking.<br><br>The FIXME comment ackn=
owledges that this sort of defeats the balancing function of multipath, so =
I&#39;m assuming this was removed for a good reason. Does anyone know why t=
his was done? In my particular use case, I benefit from balancing the paths=
 for throughput, so it&#39;s useful to me.<br><br>Thanks!<br>- Drew</div>

--00000000000014c4cb059831ce1b--

--===============1772977514116751290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============1772977514116751290==--

