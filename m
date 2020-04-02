Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB7E19C680
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 17:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585842819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WMI3cc6Tmp6VYFKnzdsHjLRKh3a5LONai11ojhvoDpk=;
	b=i8HRf6KQ8H/ZgewVAaGpomaEQWwqwuvoQj6ogMnDmQT3UHl6IavthNBUGAh05EofmF5CaA
	QRX+35iMhwpdXxrPeSIsjerPqiu4AKVBLBBMvijjpRXu3Ju6rf5VbMEQb4C5uoSsXgs+gc
	AcX3lJW2NTFGvfnswVrEEm3Xo2UWD/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-dajTQAxdMf6oJn2lroMD9w-1; Thu, 02 Apr 2020 11:53:35 -0400
X-MC-Unique: dajTQAxdMf6oJn2lroMD9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFB4D149E8;
	Thu,  2 Apr 2020 15:53:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F6565E000;
	Thu,  2 Apr 2020 15:53:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5765944CD;
	Thu,  2 Apr 2020 15:53:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032Fr001006788 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 11:53:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B92152166B2F; Thu,  2 Apr 2020 15:53:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B48332166B2C
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 15:52:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB602800897
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 15:52:57 +0000 (UTC)
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
	[209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-t1_k2gvUOMWfl_v6V1H-qQ-1; Thu, 02 Apr 2020 11:52:53 -0400
X-MC-Unique: t1_k2gvUOMWfl_v6V1H-qQ-1
Received: by mail-ua1-f72.google.com with SMTP id c4so1363625uap.15
	for <dm-devel@redhat.com>; Thu, 02 Apr 2020 08:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wEkIz9iSnd8M8VGwAnFxS2bdQP4XAi075uPPujOQyBg=;
	b=FZ7PL4V3L+ZiNmV2dzKQUQEOHbSCAf+q03TtEtf6J3ra5NhFkTPqKsHOdSyOnYTRjQ
	xMwMIh3+iMz3Blv5YFL4N9joZJMoztYLgkyVNy3UovMqccq1Vto0hp2zwFyEuV+jfRvx
	Czj8RdnIGAGcJy7gr0MqvI76xnPWO+6LkH1IGnr+Ja0gfD8ygRxFcq28FRsy5hpj+7VG
	Oa2X4NrNSXg8wwbgKcSVK0W2f4bDqyzegcCjYu5EjQ+j6pvsnsVtWAEcdC/9L5R99fFN
	HW02vsvu+j5vXKPNQ2HHlBeg3V9NqS7gk1nuQL6X2gfQK7wab2n0+ux/B503btvbVBsK
	5nTQ==
X-Gm-Message-State: AGi0PuYWIU5S+eSOrEXdNBEg6+95RCvpHtC1JGx3/wNFEAR50+HLGb18
	QgHJ3qXBiSRkbojFLFnC8ODGj9V0TP7oS4ABdWai+bmz2DWzt6+YOPwgL29zFDMXfva123rjChx
	RNnjZ9jhVenpsy7tEGwyKaiNu/DzwN0I=
X-Received: by 2002:a05:6102:403:: with SMTP id
	d3mr2488692vsq.20.1585842773226; 
	Thu, 02 Apr 2020 08:52:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypINIJXA1lfoTY8fP1uNSuJF9V/1W1B5LAoPhd488MP4Ul88JJAIx+g2xAOkaFJZ2eAWAT+QOly86OlJJfornV8=
X-Received: by 2002:a05:6102:403:: with SMTP id
	d3mr2488670vsq.20.1585842772916; 
	Thu, 02 Apr 2020 08:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
	<93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
	<CAMeeMh82FSZm4+i2+1f89P542=3HZR6S8--yP88ZiEjYSxUveA@mail.gmail.com>
	<bbebc0d7-2d53-8412-81c2-d36842fc25e9@suse.de>
In-Reply-To: <bbebc0d7-2d53-8412-81c2-d36842fc25e9@suse.de>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 2 Apr 2020 11:52:42 -0400
Message-ID: <CAMeeMh9JBuOuOi2s0VB6K1KXExUv-kyP2OavRXE==tHJAXbMFg@mail.gmail.com>
To: Hannes Reinecke <hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>,
	device-mapper development <dm-devel@redhat.com>,
	Damien LeMoal <damien.lemoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] dm-zoned: V2 metadata handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3385845115185588383=="

--===============3385845115185588383==
Content-Type: multipart/alternative; boundary="000000000000264df105a250cb46"

--000000000000264df105a250cb46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That does make sense. May I request, then, using UUID_SIZE instead of 16?
Perhaps with a compile-time assertion that UUID_SIZE has not change from 16=
?

On Thu, Apr 2, 2020 at 11:10 AM Hannes Reinecke <hare@suse.de> wrote:

> On 4/2/20 4:53 PM, John Dorminy wrote:
> > I'm worried about hardcoding uuid members as u8[16].
> >
> > May I ask why you're not using uuid_t to define it in the on-disk
> > structure? It would save the casting of the uuid members to (uuid_t *)
> > every time you use a uuid.h function.
> >
> > Possibly it is customary to use only raw datatypes on disk rather than
> > opaque types like uuid_t, I'm not sure. But in that case, perhaps using
> > the named constant UUID_SIZE instead of 16 would make the meaning
> clearer?
> >
> I prefer to use absolute types (like __u8) when describing the on-disk
> format.
> When using opaque types like uuid_t there always is the risk that the
> internal representation will change, leading to an involuntary change of
> the on-disk format structure and subsequent compability issues.
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke            Teamlead Storage & Networking
> hare@suse.de                               +49 911 74053 688
> SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=
=B6rffer
>
>

--000000000000264df105a250cb46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That does make sense. May I request, then, using UUID_SIZE=
 instead of 16? Perhaps with a compile-time assertion that UUID_SIZE has no=
t change from 16?<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 2, 2020 at 11:10 AM Hannes Reinecke &lt;<a=
 href=3D"mailto:hare@suse.de">hare@suse.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 4/2/20 4:53 PM, John Dorminy w=
rote:<br>
&gt; I&#39;m worried about hardcoding uuid members as u8[16].<br>
&gt; <br>
&gt; May I ask why you&#39;re not using uuid_t to define it in the on-disk =
<br>
&gt; structure? It would save the casting of the uuid members to (uuid_t *)=
 <br>
&gt; every time you use a uuid.h function.<br>
&gt; <br>
&gt; Possibly it is customary to use only raw datatypes on disk rather than=
 <br>
&gt; opaque types like uuid_t, I&#39;m not sure. But in that case, perhaps =
using <br>
&gt; the named constant UUID_SIZE instead of 16 would make the meaning clea=
rer?<br>
&gt; <br>
I prefer to use absolute types (like __u8) when describing the on-disk <br>
format.<br>
When using opaque types like uuid_t there always is the risk that the <br>
internal representation will change, leading to an involuntary change of <b=
r>
the on-disk format structure and subsequent compability issues.<br>
<br>
Cheers,<br>
<br>
Hannes<br>
-- <br>
Dr. Hannes Reinecke=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Teamlead Stora=
ge &amp; Networking<br>
<a href=3D"mailto:hare@suse.de" target=3D"_blank">hare@suse.de</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+49 911 74053 688<br>
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg<br>
HRB 36809 (AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6r=
ffer<br>
<br>
</blockquote></div>

--000000000000264df105a250cb46--

--===============3385845115185588383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3385845115185588383==--

