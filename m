Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DC7B5179917
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 20:35:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583350511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AmxVMPsv00e5WXmSG2UNUAMihkVpitcPy47EVSj4RuU=;
	b=KA+OmFdDRfgZaINgPMI8ABzgQQscgLGIpZj90ETLwelh886txiZ8VozzRYMKJfgG61G7d2
	wcgyMxD9D/rqpjDp+GCtDhuUkhdaWzSceIN6upg48u0rXEpekJJ1QhNI6fCGkqDH997HE7
	EBhwgXp1xLeGCpPEVOwnftTeYeGh5kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-tQpCJOWOP2uYHTDeE8uHvw-1; Wed, 04 Mar 2020 14:35:08 -0500
X-MC-Unique: tQpCJOWOP2uYHTDeE8uHvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FC138017CC;
	Wed,  4 Mar 2020 19:35:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F2C8B75C;
	Wed,  4 Mar 2020 19:35:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AE571809567;
	Wed,  4 Mar 2020 19:34:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024JYmhY005031 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 14:34:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0A8C2166B29; Wed,  4 Mar 2020 19:34:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC10C2166B27
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 19:34:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B970800297
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 19:34:44 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-54-jdM36JBiOxujCWVAaTLboQ-1; Wed, 04 Mar 2020 14:34:41 -0500
X-MC-Unique: jdM36JBiOxujCWVAaTLboQ-1
Received: by mail-lj1-f182.google.com with SMTP id a10so3332876ljp.11
	for <dm-devel@redhat.com>; Wed, 04 Mar 2020 11:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7VycLuyka7az8k4F3bi1CgrJ14xC9e3QL2Drqp6Ejfo=;
	b=kRi/jPkq1Cl+/3SwlKjyKm6e75osQxan+4t5Zb30Qv3XUAimtHOMK8NmMnWLAETahc
	hKrjIlrXD94lzsIwXCUowAhu+QvMPfx3I2eW/XobeBXbMaCK9OeODWpYqUo9rRXLJt7i
	f+RWVXnZkKmVCXGEMLMwF0NfDGCv3sptuwsZaspJYkqh13wMF8wP/idGI/BlPknSIylD
	yBPXWtwjeFX73R5AiteOkRyiRxlP70aaNV5gNiCMuxRMzJy9nDnG53Lk2f5UyU8P7BVq
	sfSdEQKn3zw518DEaRZwYpxwn1K0O/akOUAKMdFaBhrb2weQs39VF9HBfwB2BX0oNBpZ
	6k7w==
X-Gm-Message-State: ANhLgQ2ZsmaMlDb0DECIYeBABGYPM/IRa1dHOWHpV7AaILRb7FAxtVBY
	57beqMjWPYa/PHFtWQbP6wKpqc3mvPblsw==
X-Google-Smtp-Source: ADFU+vs8Wf+3p1ps6bHipIF6ndw3Kojz35ozSxv5fvJt0kl+dtVqEbIvJKepsdQC91bO2KE7hDGOvw==
X-Received: by 2002:a2e:8ed4:: with SMTP id e20mr2963681ljl.49.1583350478863; 
	Wed, 04 Mar 2020 11:34:38 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
	[209.85.167.54]) by smtp.gmail.com with ESMTPSA id
	g20sm14043778lfb.33.2020.03.04.11.34.35 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 11:34:36 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id x22so2492429lff.5
	for <dm-devel@redhat.com>; Wed, 04 Mar 2020 11:34:35 -0800 (PST)
X-Received: by 2002:a19:6a07:: with SMTP id u7mr2905996lfu.152.1583350475492; 
	Wed, 04 Mar 2020 11:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20200304150257.GA19885@redhat.com>
	<CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
	<20200304192335.GA24296@redhat.com>
In-Reply-To: <20200304192335.GA24296@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Mar 2020 13:34:23 -0600
X-Gmail-Original-Message-ID: <CAHk-=wjdzxSGRLVHheRd1WA_FhsAMEV5pOwy08x8NaMG7ty8DQ@mail.gmail.com>
Message-ID: <CAHk-=wjdzxSGRLVHheRd1WA_FhsAMEV5pOwy08x8NaMG7ty8DQ@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, linux-block <linux-block@vger.kernel.org>,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.6-rc5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6447981215970492768=="

--===============6447981215970492768==
Content-Type: multipart/alternative; boundary="000000000000a5a14a05a00c8262"

--000000000000a5a14a05a00c8262
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2020, 13:23 Mike Snitzer <snitzer@redhat.com> wrote:

>
> These versions are for userspace's benefit (be it lvm2, cryptsetup,
> multipath-tools, etc).  But yes, these versions are bogus even for
> that -- primarily because it requires userspace to know when a
> particular feature/fix it cares about was introduced.  In addition: if
> fixes, that also bump version, are marked for stable@ then we're quickly
> in versioning hell -- which is why I always try to decouple version
> bumps from fixes.
>

Yeah, I think the drm people used to have a version number too, and it's
not just fixes getting backported to stable - it's distro kernels taking
changes for new hardware without taking other parts etc.

So the versioning ends up not ever working reliably anyway - the same way
that you can't use the kernel version number to determine what system calls
are available.

So versions can not ever be anything more than informational, and it's
usually just very confusing to have multiple different version numbers (ie
"I'm running kernel v5.4, and my driver abc version is 1.4.2a" is *not* in
the least helpful).

Others have suggested setting feature flags.  I expect you'd hate those
> too.  I suspect I quickly would too given flag bits are finite and
> really tedious to deal with.
>

It also leads to some people then thinking it's ok to remove features
(perhaps to reimplement them differently) if they only clear the feature
bit.

And no, it's not how kernel interfaces work. We keep the interfaces even if
the internals change.

So I've been suggesting that people just freeze the version, or remove the
interface entirely is possible.

Because otherwise it's just a source of problems, where user space might
refuse to do something that the kernel supports because of some silly
version check...

       Linus

>

--000000000000a5a14a05a00c8262
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 4, 2020, 13:23 Mike Snitzer &lt;<a href=3D=
"mailto:snitzer@redhat.com">snitzer@redhat.com</a>&gt; wrote:</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
These versions are for userspace&#39;s benefit (be it lvm2, cryptsetup,<br>
multipath-tools, etc).=C2=A0 But yes, these versions are bogus even for<br>
that -- primarily because it requires userspace to know when a<br>
particular feature/fix it cares about was introduced.=C2=A0 In addition: if=
<br>
fixes, that also bump version, are marked for stable@ then we&#39;re quickl=
y<br>
in versioning hell -- which is why I always try to decouple version<br>
bumps from fixes.<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Yeah, I think the drm people used to have a version number=
 too, and it&#39;s not just fixes getting backported to stable - it&#39;s d=
istro kernels taking changes for new hardware without taking other parts et=
c.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So the versioning end=
s up not ever working reliably anyway - the same way that you can&#39;t use=
 the kernel version number to determine what system calls are available.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">So versions can not ever b=
e anything more than informational, and it&#39;s usually just very confusin=
g to have multiple different version numbers (ie &quot;I&#39;m running kern=
el v5.4, and my driver abc version is 1.4.2a&quot; is *not* in the least he=
lpful).</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
Others have suggested setting feature flags.=C2=A0 I expect you&#39;d hate =
those<br>
too.=C2=A0 I suspect I quickly would too given flag bits are finite and<br>
really tedious to deal with.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">It also leads to some people then thinking it&#=
39;s ok to remove features (perhaps to reimplement them differently) if the=
y only clear the feature bit.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">And no, it&#39;s not how kernel interfaces work. We keep the interfac=
es even if the internals change.=C2=A0</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">So I&#39;ve been suggesting that people just freeze the vers=
ion, or remove the interface entirely is possible.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Because otherwise it&#39;s just a source of prob=
lems, where user space might refuse to do something that the kernel support=
s because of some silly version check...</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 =C2=A0Linus</div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000a5a14a05a00c8262--

--===============6447981215970492768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============6447981215970492768==--

