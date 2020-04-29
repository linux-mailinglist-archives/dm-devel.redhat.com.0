Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A0FB21BD55B
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 09:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588143872;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4AMjNp/0V32S40w4p/3Ssn5yiWsau83mWYbTZ69gPcY=;
	b=FAMBmtCitmwV3rw5VzuIBO7B7WKGFn/PMv3gt4Ett4MedJIZxrtIzIEFN1nELbVKHFQHk8
	ImPppKSeFJ3acFYPFW/KRjgggP2aOAHIXcgzkwpQe3AA3+ueZqlAT/gnvauogmPtahK7gD
	7N18YbiZ0iGdn2WJO8UcwjhL56gd/3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-B1pa4amePJ22BiXDArtUgQ-1; Wed, 29 Apr 2020 03:04:28 -0400
X-MC-Unique: B1pa4amePJ22BiXDArtUgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68D348014D9;
	Wed, 29 Apr 2020 07:04:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 460CB5D9E8;
	Wed, 29 Apr 2020 07:04:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D33E31809542;
	Wed, 29 Apr 2020 07:04:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03T73oOL008302 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 03:03:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 82D8110166FD; Wed, 29 Apr 2020 07:03:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E7BA1008B72
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 07:03:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C87D811E7A
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 07:03:48 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
	[217.70.178.232]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-2om8ORfEO7CnoxoRViLvaA-1; Wed, 29 Apr 2020 03:03:42 -0400
X-MC-Unique: 2om8ORfEO7CnoxoRViLvaA-1
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46]) (Authenticated sender: smtp@opensvc.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id CBD8620000E;
	Wed, 29 Apr 2020 07:03:40 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k6so1084795iob.3;
	Wed, 29 Apr 2020 00:03:40 -0700 (PDT)
X-Gm-Message-State: AGi0PuZkYYSNZ5c3MkqMzx9RYg9BDyDV1TJRO9xHZVvHbBoLZe0DvDdK
	AQCG3LuXHVDxc6NmqRpcWfJmW7NvbF0IV4kXfkw=
X-Google-Smtp-Source: APiQypIyIelWaPfyTE2A7QRseFuC5TL9Q+bM6gdtVIoTXro39Hin9NIpYgIWmkQnJtUNr8R3fC+KrGvXRt8LZjTOkZg=
X-Received: by 2002:a02:a517:: with SMTP id e23mr27919256jam.56.1588143819387; 
	Wed, 29 Apr 2020 00:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200302222025.21022-1-mwilck@suse.com>
	<CABr-GncoE2_XKUUTD3GPQfeGKAVnZdavpA2_W++tMz7L=1sHow@mail.gmail.com>
	<131c09dab92b10fa261b215ca94bd41655ad330d.camel@suse.com>
In-Reply-To: <131c09dab92b10fa261b215ca94bd41655ad330d.camel@suse.com>
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 29 Apr 2020 09:03:28 +0200
X-Gmail-Original-Message-ID: <CABr-GnewZXFi2-EMyFPoz7mN_Sqr=QPNzus2p957Fve+sUUR-g@mail.gmail.com>
Message-ID: <CABr-GnewZXFi2-EMyFPoz7mN_Sqr=QPNzus2p957Fve+sUUR-g@mail.gmail.com>
To: Martin Wilck <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/4] multipath-tools unit test fixups
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
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============9179637576807814293=="

--===============9179637576807814293==
Content-Type: multipart/alternative; boundary="00000000000034f78305a4688c35"

--00000000000034f78305a4688c35
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Yes I did notice.
I got sidetracked by other projects, but I intent to merge this patch and
tag the release this week.

Thank you for the notice,
Christophe.

On Tue, Apr 28, 2020 at 11:54 PM Martin Wilck <mwilck@suse.com> wrote:

> Hello Christophe,
>
> On Tue, 2020-03-03 at 00:38 +0100, Christophe Varoqui wrote:
> > Ben,
> >
> > take the time you need for review,
> > I'll wait for this patchset before tagging the next version.
>
> did you notice that Ben acked this set on Mar 13th?
>
> https://www.redhat.com/archives/dm-devel/2020-March/msg00044.html
>
> Regards,
> Martin
>
> >
> > Best,
> > Christophe.
> >
> > On Mon, Mar 2, 2020 at 11:20 PM <mwilck@suse.com> wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >
> > > Hi Christophe, hi Ben,
> > >
> > > as announced in my previous post, here's a set of minor fixups for
> > > the
> > > unit tests. The README.md should have been created long ago. My
> > > main
> > > issue is that I'd prefer not to have a file under git control that
> > > is
> > > likely to be customized in every developer's environment and needs
> > > to be stashed away before every serious git work.
> > >
> > > Martin Wilck (4):
> > >   Remove tests/directio_test_dev
> > >   tests/Makefile: allow setting DIO_TEST_DEV in the environment
> > >   tests/Makefile: add test_clean target
> > >   tests: add README.md
> > >
> > >  tests/Makefile          | 13 +++++---
> > >  tests/README.md         | 72
> > > +++++++++++++++++++++++++++++++++++++++++
> > >  tests/directio_test_dev |  4 ---
> > >  3 files changed, 81 insertions(+), 8 deletions(-)
> > >  create mode 100644 tests/README.md
> > >  delete mode 100644 tests/directio_test_dev
> > >
> > > --
> > > dm-devel mailing list
> > > dm-devel@redhat.com
> > > https://www.redhat.com/mailman/listinfo/dm-devel
>
>
>

--00000000000034f78305a4688c35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Martin,</div><div><br></div>Yes I did notice.=
<div>I got sidetracked by other projects, but I intent to merge this patch =
and tag the release this week.</div><div><br></div><div>Thank you for the n=
otice,</div><div>Christophe.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2020 at 11:54 PM Martin W=
ilck &lt;<a href=3D"mailto:mwilck@suse.com">mwilck@suse.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Christophe=
,<br>
<br>
On Tue, 2020-03-03 at 00:38 +0100, Christophe Varoqui wrote:<br>
&gt; Ben,<br>
&gt; <br>
&gt; take the time you need for review,<br>
&gt; I&#39;ll wait for this patchset before tagging the next version.<br>
<br>
did you notice that Ben acked this set on Mar 13th?<br>
<br>
<a href=3D"https://www.redhat.com/archives/dm-devel/2020-March/msg00044.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archives/dm-=
devel/2020-March/msg00044.html</a><br>
<br>
Regards,<br>
Martin<br>
<br>
&gt; <br>
&gt; Best,<br>
&gt; Christophe.<br>
&gt; <br>
&gt; On Mon, Mar 2, 2020 at 11:20 PM &lt;<a href=3D"mailto:mwilck@suse.com"=
 target=3D"_blank">mwilck@suse.com</a>&gt; wrote:<br>
&gt; &gt; From: Martin Wilck &lt;<a href=3D"mailto:mwilck@suse.com" target=
=3D"_blank">mwilck@suse.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Hi Christophe, hi Ben,<br>
&gt; &gt; <br>
&gt; &gt; as announced in my previous post, here&#39;s a set of minor fixup=
s for<br>
&gt; &gt; the<br>
&gt; &gt; unit tests. The README.md should have been created long ago. My<b=
r>
&gt; &gt; main<br>
&gt; &gt; issue is that I&#39;d prefer not to have a file under git control=
 that<br>
&gt; &gt; is<br>
&gt; &gt; likely to be customized in every developer&#39;s environment and =
needs<br>
&gt; &gt; to be stashed away before every serious git work.<br>
&gt; &gt; <br>
&gt; &gt; Martin Wilck (4):<br>
&gt; &gt;=C2=A0 =C2=A0Remove tests/directio_test_dev<br>
&gt; &gt;=C2=A0 =C2=A0tests/Makefile: allow setting DIO_TEST_DEV in the env=
ironment<br>
&gt; &gt;=C2=A0 =C2=A0tests/Makefile: add test_clean target<br>
&gt; &gt;=C2=A0 =C2=A0tests: add README.md<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 tests/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++=
---<br>
&gt; &gt;=C2=A0 tests/README.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 72<br>
&gt; &gt; +++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 tests/directio_test_dev |=C2=A0 4 ---<br>
&gt; &gt;=C2=A0 3 files changed, 81 insertions(+), 8 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 tests/README.md<br>
&gt; &gt;=C2=A0 delete mode 100644 tests/directio_test_dev<br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; dm-devel mailing list<br>
&gt; &gt; <a href=3D"mailto:dm-devel@redhat.com" target=3D"_blank">dm-devel=
@redhat.com</a><br>
&gt; &gt; <a href=3D"https://www.redhat.com/mailman/listinfo/dm-devel" rel=
=3D"noreferrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/d=
m-devel</a><br>
<br>
<br>
</blockquote></div>

--00000000000034f78305a4688c35--

--===============9179637576807814293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============9179637576807814293==--

