Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BD19F176845
	for <lists+dm-devel@lfdr.de>; Tue,  3 Mar 2020 00:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583192186;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=aoLtYafSKmAG72P5tsIHOOpX1F0mA2syaBQoXTHQhto=;
	b=FjHgSEUnQ3YAKRpfdVLe0L59nd8n2C6LnYdyr9hvYTU/rqprjz8UX4Dp5hMSeFOZ/uD2ic
	nHFuCvUnPG+7eVXIR0nhBAUxFzGsi7OEpSfqDOCn4AWbIVA6tP34MOk7SMsF5X8EHp8mF+
	/exKCkn0XDAvLic+3CWDgzdoCbH2als=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-WJJ_t2tdPf6R_N_x5c3B0Q-1; Mon, 02 Mar 2020 18:36:23 -0500
X-MC-Unique: WJJ_t2tdPf6R_N_x5c3B0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00DC7190B2A6;
	Mon,  2 Mar 2020 23:36:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6DF560C05;
	Mon,  2 Mar 2020 23:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65EA086A01;
	Mon,  2 Mar 2020 23:36:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022NZnIM007485 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 18:35:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D2352166B2E; Mon,  2 Mar 2020 23:35:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38C3B2166B2B
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 23:35:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DD56101A55A
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 23:35:46 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
	[217.70.178.231]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-104-J5OY1RzRO8abpKWbijXHIg-1; Mon, 02 Mar 2020 18:35:43 -0500
X-MC-Unique: J5OY1RzRO8abpKWbijXHIg-1
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
	[209.85.166.172]) (Authenticated sender: gmail@opensvc.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id F151D100003;
	Mon,  2 Mar 2020 23:35:41 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id a6so1107844ilc.4;
	Mon, 02 Mar 2020 15:35:41 -0800 (PST)
X-Gm-Message-State: ANhLgQ1ZIQHLQim2Xnnom0VWZfIlb3xmkLM1vOmQ0EU1ijFZJZiBsWxl
	O1BXLc9V6OZSXA/OaXjy1ObjEWCuHH57KqA9j9A=
X-Google-Smtp-Source: ADFU+vtPOd+zdCySl4i0VR4vf6whBEVaqfa+Lfh2OwhISXR77tlgqe1vFXrUNGdvS98coZ+hd7Vy09Pekz69iNRTR7A=
X-Received: by 2002:a05:6e02:eb4:: with SMTP id
	u20mr1997755ilj.57.1583192140420; 
	Mon, 02 Mar 2020 15:35:40 -0800 (PST)
MIME-Version: 1.0
References: <CABr-Gne_oOns4W0A4Ny4t4xRPbU3qdtS5Z6BSt7wQ0N7cRqDeQ@mail.gmail.com>
	<3f8ae4512f68c5ba0cce93e5da27bb812dd8107e.camel@suse.com>
In-Reply-To: <3f8ae4512f68c5ba0cce93e5da27bb812dd8107e.camel@suse.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 3 Mar 2020 00:35:29 +0100
X-Gmail-Original-Message-ID: <CABr-GnckSFPe5aRMQgRqUR2Lg9q5nomX00pL9JKOk-qoGAweMw@mail.gmail.com>
Message-ID: <CABr-GnckSFPe5aRMQgRqUR2Lg9q5nomX00pL9JKOk-qoGAweMw@mail.gmail.com>
To: Martin Wilck <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6821510070975462820=="

--===============6821510070975462820==
Content-Type: multipart/alternative; boundary="000000000000241c54059fe7a5dd"

--000000000000241c54059fe7a5dd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Thanks for pointing these missing patches.
They are now merged.

Best,
Christophe.

On Mon, Mar 2, 2020 at 10:51 PM Martin Wilck <Martin.Wilck@suse.com> wrote:

> Hi Christophe,
>
> On Mon, 2020-03-02 at 11:19 +0100, Christophe Varoqui wrote:
> > Hi ben, Martin,
> >
> > I finally catched up with your changes from october till now.
> > Please review I did not mess up the merges, then i'll commit a
> > version bump.
>
> This is great, thanks a lot!
> I admit that I was starting to get nervous :-)
>
> It seems that you missed the following patches from me, reviewed by
> Ben:
>
>  * My "Drop nr_active, and some more fixes" series from 11/19
>    - "multipathd: move set_no_path_retry() back to libmultipath"
>       Review:
> https://www.redhat.com/archives/dm-devel/2019-November/msg00099.html
>    - libmultipath: dict.c: rename duplicate set_no_path_retry()
>       Review:
> https://www.redhat.com/archives/dm-devel/2019-November/msg00100.html
>    - libmultipath: drop mpp->nr_active field
>       Review:
> https://www.redhat.com/archives/dm-devel/2019-December/msg00037.html
>    - libmultipath: fix (max_)polling_interval setting logic
>      Review:
> https://www.redhat.com/archives/dm-devel/2019-November/msg00101.html
>    - libmultipath: fix ALUA autodetection when paths are down
>      Review:
> https://www.redhat.com/archives/dm-devel/2019-November/msg00107.html
>
>  * libmultipath: fix compilation with -fno-common
>    Review:
> https://www.redhat.com/archives/dm-devel/2020-January/msg00118.html
>  * libmultipath: fix files read from config_dir (from Enzo):
>    Review (by me):
> https://www.redhat.com/archives/dm-devel/2020-February/msg00058.html
>
> Furthermore, as I indicated before, I'd like to propose a minor change on
> top of Ben's
> last series before you tag a new version. No C code changes, just build
> logic for
> unit tests, and a README. I'll post it ASAP.
>
> Regards
> Martin
>
> --
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE
> Software Solutions Germany GmbH
> HRB 36809 (AG N=C3=BCrnberg) GF: Felix
> Imend=C3=B6rffer
>
>

--000000000000241c54059fe7a5dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Martin,</div><div><br></div>Thanks for pointing th=
ese missing patches.<div>They are now merged.</div><div><br></div><div>Best=
,</div><div>Christophe.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 2, 2020 at 10:51 PM Martin Wilck =
&lt;<a href=3D"mailto:Martin.Wilck@suse.com">Martin.Wilck@suse.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Christ=
ophe,<br>
<br>
On Mon, 2020-03-02 at 11:19 +0100, Christophe Varoqui wrote:<br>
&gt; Hi ben, Martin,<br>
&gt; <br>
&gt; I finally catched up with your changes from october till now.<br>
&gt; Please review I did not mess up the merges, then i&#39;ll commit a<br>
&gt; version bump.<br>
<br>
This is great, thanks a lot!<br>
I admit that I was starting to get nervous :-)<br>
<br>
It seems that you missed the following patches from me, reviewed by<br>
Ben:<br>
<br>
=C2=A0* My &quot;Drop nr_active, and some more fixes&quot; series from 11/1=
9<br>
=C2=A0 =C2=A0- &quot;multipathd: move set_no_path_retry() back to libmultip=
ath&quot;<br>
=C2=A0 =C2=A0 =C2=A0 Review: <a href=3D"https://www.redhat.com/archives/dm-=
devel/2019-November/msg00099.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.redhat.com/archives/dm-devel/2019-November/msg00099.html</a><br>
=C2=A0 =C2=A0- libmultipath: dict.c: rename duplicate set_no_path_retry()<b=
r>
=C2=A0 =C2=A0 =C2=A0 Review: <a href=3D"https://www.redhat.com/archives/dm-=
devel/2019-November/msg00100.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.redhat.com/archives/dm-devel/2019-November/msg00100.html</a><br>
=C2=A0 =C2=A0- libmultipath: drop mpp-&gt;nr_active field<br>
=C2=A0 =C2=A0 =C2=A0 Review: <a href=3D"https://www.redhat.com/archives/dm-=
devel/2019-December/msg00037.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.redhat.com/archives/dm-devel/2019-December/msg00037.html</a><br>
=C2=A0 =C2=A0- libmultipath: fix (max_)polling_interval setting logic<br>
=C2=A0 =C2=A0 =C2=A0Review: <a href=3D"https://www.redhat.com/archives/dm-d=
evel/2019-November/msg00101.html" rel=3D"noreferrer" target=3D"_blank">http=
s://www.redhat.com/archives/dm-devel/2019-November/msg00101.html</a><br>
=C2=A0 =C2=A0- libmultipath: fix ALUA autodetection when paths are down<br>
=C2=A0 =C2=A0 =C2=A0Review: <a href=3D"https://www.redhat.com/archives/dm-d=
evel/2019-November/msg00107.html" rel=3D"noreferrer" target=3D"_blank">http=
s://www.redhat.com/archives/dm-devel/2019-November/msg00107.html</a><br>
<br>
=C2=A0* libmultipath: fix compilation with -fno-common<br>
=C2=A0 =C2=A0Review: <a href=3D"https://www.redhat.com/archives/dm-devel/20=
20-January/msg00118.html" rel=3D"noreferrer" target=3D"_blank">https://www.=
redhat.com/archives/dm-devel/2020-January/msg00118.html</a><br>
=C2=A0* libmultipath: fix files read from config_dir (from Enzo):<br>
=C2=A0 =C2=A0Review (by me): <a href=3D"https://www.redhat.com/archives/dm-=
devel/2020-February/msg00058.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://www.redhat.com/archives/dm-devel/2020-February/msg00058.html</a><br>
<br>
Furthermore, as I indicated before, I&#39;d like to propose a minor change =
on top of Ben&#39;s<br>
last series before you tag a new version. No C code changes, just build log=
ic for<br>
unit tests, and a README. I&#39;ll post it ASAP.<br>
<br>
Regards<br>
Martin<br>
<br>
-- <br>
Dr. Martin Wilck &lt;<a href=3D"mailto:mwilck@suse.com" target=3D"_blank">m=
wilck@suse.com</a>&gt;, Tel. +49 (0)911 74053 2107<br>
SUSE<br>
Software Solutions Germany GmbH <br>
HRB 36809 (AG N=C3=BCrnberg) GF: Felix<br>
Imend=C3=B6rffer<br>
<br>
</blockquote></div>

--000000000000241c54059fe7a5dd--

--===============6821510070975462820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============6821510070975462820==--

