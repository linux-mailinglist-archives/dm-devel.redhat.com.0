Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BDEC81307DE
	for <lists+dm-devel@lfdr.de>; Sun,  5 Jan 2020 13:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578226929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LalMS5DxVHuw+df1sUMz6QCXWnuaVZxqi75QxEt3ySM=;
	b=SpjU8SDpuIehGzJabWlPT81Eassy9h8oo6wfpluzuxkAdEZrPQ0HVyahG+Sks/fQ4h+gnn
	ViIhzKyZ7F+PRh/X0R8mD2B63qhEfLfahCHnDqREPVy9KUeN70Q4ozEdIrNTvJZnxC2iEe
	Dm5ak5k1+hpiCSOWfLe40DYO6Y0PiWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-RvS4VTCFPyK7w8bAup2EZg-1; Sun, 05 Jan 2020 07:22:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F588107ACC4;
	Sun,  5 Jan 2020 12:21:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D852E1036D1B;
	Sun,  5 Jan 2020 12:21:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 137C5820F4;
	Sun,  5 Jan 2020 12:21:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 005CLT7v000598 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Jan 2020 07:21:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 29D7910F1C0E; Sun,  5 Jan 2020 12:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2415810F1C10
	for <dm-devel@redhat.com>; Sun,  5 Jan 2020 12:21:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160EA8001A1
	for <dm-devel@redhat.com>; Sun,  5 Jan 2020 12:21:26 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-wzzTpF2TPpGgeoRhfRDtLQ-1; Sun, 05 Jan 2020 07:21:21 -0500
Received: by mail-ed1-f50.google.com with SMTP id j17so45240913edp.3;
	Sun, 05 Jan 2020 04:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VMaIiWgmkIUy6mjRVxGZAzJNMMEHbFapRvwhLroFC44=;
	b=sfGHFUcm8dV+8RcMOAGB//+JnvAwqqpYDbVvDL/o0e3GOkJNsSBXF7TJNyREFBCE+t
	SAV7ZaEBvmBcAICyg/DnTUn+qMSOgZ3N11U8fmxFbdRcDYL+I6pLWFaiDsGZ/h1eZ+tp
	JvZb/6+AW8w7RtlfIMhnfrT9+tgY3TKiBhhiIszTtVXyTGbd+Ze93hJabN2Ru9ZOJnxw
	YQomzNbvHCdjQrmfm4p0Efsgck2Jc7YySJ/6rcuuB863/9+I/F5se7JL93DAgKzilU/1
	k37cabceXCuByRczsQXximCx4fHwaAdhLhu/bC/3DjOV/t+5uIERgXeNS8PLvPyz4Sij
	+Vsg==
X-Gm-Message-State: APjAAAWCcMJufky0RrWEOm9qoD1N9IkA15UTLEeINCfMWdSJ4JyEn+nb
	i16t912nLwWVsRWSJFZE9L3N2Lcxnfc3DDQMqAQPvTxS
X-Google-Smtp-Source: APXvYqxJdb6vdEXnM98rdEzFtmgYshrMIeXwgq9Hd+zwBN+MgRANb50AdzTdSGP5a1kxQxln/7owYYev8GuqCnPmypY=
X-Received: by 2002:a17:906:1c89:: with SMTP id
	g9mr102978495ejh.114.1578226878983; 
	Sun, 05 Jan 2020 04:21:18 -0800 (PST)
MIME-Version: 1.0
References: <CAJTWkdu1-k5m0F-uzp-EMrncL1w4wLqEi8LgF0U1Js_Nf-YphQ@mail.gmail.com>
	<alpine.LRH.2.02.2001031206190.11685@file01.intranet.prod.int.rdu2.redhat.com>
	<CAJTWkdvOtgzrrJiT+FQccCFu4sXzncHZDo7=RW5TWqiw8rxfLg@mail.gmail.com>
	<alpine.LRH.2.02.2001050431590.6830@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2001050431590.6830@file01.intranet.prod.int.rdu2.redhat.com>
From: Patrick Dung <patdung100@gmail.com>
Date: Sun, 5 Jan 2020 20:20:53 +0800
Message-ID: <CAJTWkducreuW2LcOaipUMnNRFhvjd4N_LdKrnND-wBfCS593jg@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-MC-Unique: wzzTpF2TPpGgeoRhfRDtLQ-1
X-MC-Unique: RvS4VTCFPyK7w8bAup2EZg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] About dm-integrity layer and fsync
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed; boundary="===============0776381399121141423=="

--===============0776381399121141423==
Content-Type: multipart/alternative; boundary="0000000000007f3471059b639450"

--0000000000007f3471059b639450
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OK, I see. Thanks Mikulas for the explanation.

On Sun, Jan 5, 2020 at 5:39 PM Mikulas Patocka <mpatocka@redhat.com> wrote:

>
>
> On Sat, 4 Jan 2020, Patrick Dung wrote:
>
> > Thanks for reply. After performing an additional testing with SSD. I
> have more questions.
> >
> > Firstly, about the additional testing with SSD:
> > I tested it with SSD (in Linux software raid level 10 setup). The resul=
t
> shown using dm-integrity is faster than using XFS directly. For using
> dm-integrity, fio shows
> > lots of I/O merges by the scheduler. Please find the attachment for the
> result.
> >
> > Finally, please find the questions below:
> > 1) So after the dm-integrity journal is written to the actual back end
> storage (hard drive), then fsync would then report completed?
>
> Yes.
>
> > 2) To my understanding, for using dm-integrity with journal mode. Data
> has to written into the storage device twice (one part is the dm-integrit=
y
> journal, the other
> > one is the actual data). For the fio test, the data should be random an=
d
> sustained for 60 seconds. But using dm-integrity with journal mode is sti=
ll
> faster.
> >
> > Thanks,
> > Patrick
>
> With ioengine=3Dsync, fio sends one I/O, waits for it to finish, send
> another I/O, wait for it to finish, etc.
>
> With dm-integrity, I/Os will be written to the journal (that is held in
> memory, no disk I/O is done), and when fio does the sync(), fsync() or
> fdatasync() syscall, the journal is written to the disk. After the journa=
l
> is flushed, the blocks are written concurrently to the disk locations.
>
> The SSD has better performance for concurrent write then for
> block-by-block write, so that's why you see performance improvement with
> dm-integrity.
>
> Mikulas
>
>

--0000000000007f3471059b639450
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I see. Thanks Mikulas for the explanation.<br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, =
Jan 5, 2020 at 5:39 PM Mikulas Patocka &lt;<a href=3D"mailto:mpatocka@redha=
t.com">mpatocka@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
<br>
On Sat, 4 Jan 2020, Patrick Dung wrote:<br>
<br>
&gt; Thanks for reply. After performing an additional testing with SSD. I h=
ave more questions.<br>
&gt; <br>
&gt; Firstly, about the additional testing with SSD:<br>
&gt; I tested it with SSD (in Linux software raid level 10 setup). The resu=
lt shown using dm-integrity is faster than using XFS directly. For using dm=
-integrity, fio shows<br>
&gt; lots of I/O merges by the scheduler. Please find the attachment for th=
e result.<br>
&gt; <br>
&gt; Finally, please find the questions below:<br>
&gt; 1) So after the dm-integrity journal is written to the actual back end=
 storage (hard drive), then fsync would then report completed?<br>
<br>
Yes.<br>
<br>
&gt; 2) To my understanding, for using dm-integrity with journal mode. Data=
 has to written into the storage device twice (one part is the dm-integrity=
 journal, the other<br>
&gt; one is the actual data). For the fio test, the data should be random a=
nd sustained for 60 seconds. But using dm-integrity with journal mode is st=
ill faster.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Patrick<br>
<br>
With ioengine=3Dsync, fio sends one I/O, waits for it to finish, send <br>
another I/O, wait for it to finish, etc.<br>
<br>
With dm-integrity, I/Os will be written to the journal (that is held in <br=
>
memory, no disk I/O is done), and when fio does the sync(), fsync() or <br>
fdatasync() syscall, the journal is written to the disk. After the journal =
<br>
is flushed, the blocks are written concurrently to the disk locations.<br>
<br>
The SSD has better performance for concurrent write then for <br>
block-by-block write, so that&#39;s why you see performance improvement wit=
h <br>
dm-integrity.<br>
<br>
Mikulas<br>
<br>
</blockquote></div>

--0000000000007f3471059b639450--

--===============0776381399121141423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0776381399121141423==--

