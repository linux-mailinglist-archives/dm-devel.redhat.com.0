Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E73B917CDB9
	for <lists+dm-devel@lfdr.de>; Sat,  7 Mar 2020 12:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583578903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Hg6/vY4hEXKwo+l6kbcT3VDZ6NPn6uw5QYQprxrxR9M=;
	b=GcnaJRTuUM/0+ZHH1ZmNq3abtf+DqSlkMWk4Z6Yr01bsloBqMn/6WTa1o8eCJF3LN9rif/
	SVPTyKQNtiWvQzgunL5vYw7MEUrKdhBsVwG3BLzrWTqZ/QdSoPCnPwP2FsoTsZmw7PsDBS
	GuGTZ3Lhn3x4e8xplwJDSTgASdQlo9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-Uwyo-2pANPuwrIUZ6IedSA-1; Sat, 07 Mar 2020 06:01:40 -0500
X-MC-Unique: Uwyo-2pANPuwrIUZ6IedSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB37D107ACC7;
	Sat,  7 Mar 2020 11:01:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 510935C1B2;
	Sat,  7 Mar 2020 11:01:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8677E18089C8;
	Sat,  7 Mar 2020 11:01:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 027B0rsn032302 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 7 Mar 2020 06:00:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B2E80121850; Sat,  7 Mar 2020 11:00:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACDA1121859
	for <dm-devel@redhat.com>; Sat,  7 Mar 2020 11:00:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 115E68BA502
	for <dm-devel@redhat.com>; Sat,  7 Mar 2020 11:00:51 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-SL8MQp58PaeLZmk4Kl-zLQ-1; Sat, 07 Mar 2020 06:00:47 -0500
X-MC-Unique: SL8MQp58PaeLZmk4Kl-zLQ-1
X-Originating-IP: 209.85.166.176
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176]) (Authenticated sender: gmail@opensvc.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 437B8FF806;
	Sat,  7 Mar 2020 11:00:45 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id f5so4441762ilq.5;
	Sat, 07 Mar 2020 03:00:45 -0800 (PST)
X-Gm-Message-State: ANhLgQ3/A9Ln1YlQazSkc8CibWcWK7LjNKxcYdbO4pV6tYFpiH7XAWjQ
	16AyAHSNuCbNZ+a4MrQugd8z6hqFtbZFN94NvJE=
X-Google-Smtp-Source: ADFU+vs5dU/IYDZKGpsuOfk7nkoICU+PqP0NP7L3Z13/qO4Iuz7JFzWzTuZRS2aqv14tQf6qLvc6SSbOGXfCIiwSjcQ=
X-Received: by 2002:a92:760e:: with SMTP id r14mr6805670ilc.59.1583578843651; 
	Sat, 07 Mar 2020 03:00:43 -0800 (PST)
MIME-Version: 1.0
References: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
	<3f8ae4512f68c5ba0cce93e5da27bb812dd8107e.camel@suse.com>
	<CABr-GnckSFPe5aRMQgRqUR2Lg9q5nomX00pL9JKOk-qoGAweMw@mail.gmail.com>
	<5773a737cfb455e37b3b54a728080d2087332734.camel@suse.com>
In-Reply-To: <5773a737cfb455e37b3b54a728080d2087332734.camel@suse.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Sat, 7 Mar 2020 12:00:32 +0100
X-Gmail-Original-Message-ID: <CABr-GncN5onh6j-=QedBoqqm6+EradOQYVejEN0N-R5Oz2WUVA@mail.gmail.com>
Message-ID: <CABr-GncN5onh6j-=QedBoqqm6+EradOQYVejEN0N-R5Oz2WUVA@mail.gmail.com>
To: Martin Wilck <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] multipath-tools merges
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============3797076274951972188=="

--===============3797076274951972188==
Content-Type: multipart/alternative; boundary="00000000000073250e05a041aefd"

--00000000000073250e05a041aefd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks,
the delta is committed with your authoring information.

Best,
Christophe

On Fri, Mar 6, 2020 at 5:28 PM Martin Wilck <Martin.Wilck@suse.com> wrote:

> Hello Christophe,
>
> On Tue, 2020-03-03 at 00:35 +0100, Christophe Varoqui wrote:
> > Hi Martin,
> >
> > Thanks for pointing these missing patches.
> > They are now merged.
>
> Thanks. Still a nit: you picked v1 of my
> "libmultipath: drop mpp->nr_active field" patch (from Nov. 15th) rather
> than v2 (from Nov. 20th):
> https://www.redhat.com/archives/dm-devel/2019-November/msg00133.html
>
> The v2 patch added some additional hunks (attached) and also a some
> text in the commit message.
>
> Regards,
> Martin
>
> --
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=C3=BCrnberg GF: Felix
> Imend=C3=B6rffer
>
>
>

--00000000000073250e05a041aefd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks,<div>the delta is committed with your authoring inf=
ormation.</div><div><br></div><div>Best,</div><div>Christophe</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
Mar 6, 2020 at 5:28 PM Martin Wilck &lt;<a href=3D"mailto:Martin.Wilck@suse=
.com">Martin.Wilck@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello Christophe,<br>
<br>
On Tue, 2020-03-03 at 00:35 +0100, Christophe Varoqui wrote:<br>
&gt; Hi Martin,<br>
&gt; <br>
&gt; Thanks for pointing these missing patches.<br>
&gt; They are now merged.<br>
<br>
Thanks. Still a nit: you picked v1 of my <br>
&quot;libmultipath: drop mpp-&gt;nr_active field&quot; patch (from Nov. 15t=
h) rather<br>
than v2 (from Nov. 20th):<br>
<a href=3D"https://www.redhat.com/archives/dm-devel/2019-November/msg00133.=
html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archives/=
dm-devel/2019-November/msg00133.html</a><br>
<br>
The v2 patch added some additional hunks (attached) and also a some<br>
text in the commit message.<br>
<br>
Regards,<br>
Martin<br>
<br>
-- <br>
Dr. Martin Wilck &lt;<a href=3D"mailto:mwilck@suse.com" target=3D"_blank">m=
wilck@suse.com</a>&gt;, Tel. +49 (0)911 74053 2107<br>
SUSE=C2=A0 Software Solutions Germany GmbH<br>
HRB 36809, AG N=C3=BCrnberg GF: Felix<br>
Imend=C3=B6rffer<br>
<br>
<br>
</blockquote></div>

--00000000000073250e05a041aefd--

--===============3797076274951972188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3797076274951972188==--

