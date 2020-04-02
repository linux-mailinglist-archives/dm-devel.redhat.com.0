Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9FD519CAB9
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 22:02:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585857750;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tPBcaV5mZQgqpLnzx3tK+pmq4Cq9+8rpyAYJx/LepC4=;
	b=LUHR+0wYPOkguoPHtMK31YvogPLarfdCZRPhui3BUY5321fue2m+o/F7Q59zC+8kqjCrmP
	0+hd9SNoShhOG+71MzQaxw7Twvk1BVUfW4xDIjzKq5+wmfrKB9hDdAYx0HrAdCLjmp8vtu
	xDyUmDE98ecSZyPUYavTFvZtlSGjgEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-vbXGvqg8PaW1CskzQZm5-w-1; Thu, 02 Apr 2020 16:02:26 -0400
X-MC-Unique: vbXGvqg8PaW1CskzQZm5-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894488017CE;
	Thu,  2 Apr 2020 20:02:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 010371001B09;
	Thu,  2 Apr 2020 20:02:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AFC11803C33;
	Thu,  2 Apr 2020 20:02:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032K1l7L022598 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 16:01:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52548F8A0B; Thu,  2 Apr 2020 20:01:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E98D12751B
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 20:01:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACAD185A791
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 20:01:44 +0000 (UTC)
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
	[209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-202-bAt9rTsXNm2CfRu9XK49Ow-1; Thu, 02 Apr 2020 16:01:40 -0400
X-MC-Unique: bAt9rTsXNm2CfRu9XK49Ow-1
Received: by mail-ua1-f70.google.com with SMTP id i35so1743718uai.14
	for <dm-devel@redhat.com>; Thu, 02 Apr 2020 13:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CnQg59mZL8nTMnw45zgTSGhSbhduLazJlTyOwfJWvcM=;
	b=LhvwtFFuMTMY0v+G1uEOtmbKCbq/0TTCqmsBQfgiuAsGiDAFTwkG6qiDsciSyZ7QUM
	d4TqSM/2UzGUha8MYXt9STMoK2WubuaWiiiO4k9eAExqltmWhQlvna9YYZnEleeZBOV1
	mR1B53IjpDu69o3GGvRAspeS6fFCul6IAJFkjFFP6klOxwEnGLSJpoQh9uO/zPxMnssF
	w2KYQ2Yo0tebuu+3clBGZ6gODi4S4y6LHxdCa9NkMOehsWXwyUdK4PsfiAerj4j4BTJx
	5sUGYClTLvvXOnEvhrS/Gj7dJauB1yIQhUIm80qqfROdwVcA6Ie+utATa4r8wsfjUJAy
	QPlA==
X-Gm-Message-State: AGi0PuZdJH18KWgZfWUWZI0VewbRz+2p0UTNLjKctOiH0VWn6QkfzgT5
	JuCaATvEdCxWY6qCWSwO9GFElwobXj5JYijCVwEhcSuIwENxjQ0b/HHDOR7jG6ydtACMqEH5kOb
	Jqa8J6dUN92DvLn/r5mQKeVJf7vUrXJQ=
X-Received: by 2002:ab0:311:: with SMTP id 17mr4152321uat.131.1585857700130;
	Thu, 02 Apr 2020 13:01:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypIajYteNO1hy6uDqnT0YY2/dvhx/xXK4u7OEplqk4WTuFat3GWoamHuTwemmcXyPE6WsCF+p64om5AdRIb3iGU=
X-Received: by 2002:ab0:311:: with SMTP id 17mr4152295uat.131.1585857699856;
	Thu, 02 Apr 2020 13:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
	<93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
	<CAMeeMh82FSZm4+i2+1f89P542=3HZR6S8--yP88ZiEjYSxUveA@mail.gmail.com>
	<bbebc0d7-2d53-8412-81c2-d36842fc25e9@suse.de>
	<CAMeeMh9JBuOuOi2s0VB6K1KXExUv-kyP2OavRXE==tHJAXbMFg@mail.gmail.com>
In-Reply-To: <CAMeeMh9JBuOuOi2s0VB6K1KXExUv-kyP2OavRXE==tHJAXbMFg@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 2 Apr 2020 16:01:28 -0400
Message-ID: <CAMeeMh8+6ssUyYqiDQL2kWpwPwjPZRQJbLa7bDUL2tYqeUKjOw@mail.gmail.com>
To: Hannes Reinecke <hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5071372349080338198=="

--===============5071372349080338198==
Content-Type: multipart/alternative; boundary="000000000000dd658205a25444ee"

--000000000000dd658205a25444ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, I take that back. If it is a worry that the internal
representation will change, it seems also unsafe to be casting the sixteen
bytes as a uuid_t when copying into them with uuid_copy(). If the internal
representation changed to add a new field, then there would be a buffer
overrun when using uuid_copy(). If the internal representation changed the
order of the bytes, uuid_copy() would propagate that to the on-disk
structure and yield compatibility issues.

Perhaps it would be safer to store the UUIDs on disk as a string. Or add to
uuid.[ch] a function to get the raw bytes in a fixed order suitable for
storing on disk?

On Thu, Apr 2, 2020 at 11:52 AM John Dorminy <jdorminy@redhat.com> wrote:

> That does make sense. May I request, then, using UUID_SIZE instead of 16?
> Perhaps with a compile-time assertion that UUID_SIZE has not change from =
16?
>
> On Thu, Apr 2, 2020 at 11:10 AM Hannes Reinecke <hare@suse.de> wrote:
>
>> On 4/2/20 4:53 PM, John Dorminy wrote:
>> > I'm worried about hardcoding uuid members as u8[16].
>> >
>> > May I ask why you're not using uuid_t to define it in the on-disk
>> > structure? It would save the casting of the uuid members to (uuid_t *)
>> > every time you use a uuid.h function.
>> >
>> > Possibly it is customary to use only raw datatypes on disk rather than
>> > opaque types like uuid_t, I'm not sure. But in that case, perhaps usin=
g
>> > the named constant UUID_SIZE instead of 16 would make the meaning
>> clearer?
>> >
>> I prefer to use absolute types (like __u8) when describing the on-disk
>> format.
>> When using opaque types like uuid_t there always is the risk that the
>> internal representation will change, leading to an involuntary change of
>> the on-disk format structure and subsequent compability issues.
>>
>> Cheers,
>>
>> Hannes
>> --
>> Dr. Hannes Reinecke            Teamlead Storage & Networking
>> hare@suse.de                               +49 911 74053 688
>> SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
>> HRB 36809 (AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=
=B6rffer
>>
>>

--000000000000dd658205a25444ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually, I take that back. If it is a worry that the inte=
rnal representation will change, it seems also unsafe to be casting the six=
teen bytes as a uuid_t when copying into them with uuid_copy(). If the inte=
rnal representation changed to add a new field, then there would be a buffe=
r overrun when using uuid_copy(). If the internal representation changed th=
e order of the bytes, uuid_copy() would propagate that to the on-disk struc=
ture and yield compatibility issues. <br><br>Perhaps it would be safer to s=
tore the UUIDs on disk as a string. Or add to uuid.[ch] a function to get t=
he raw bytes in a fixed order suitable for storing on disk? <br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr=
 2, 2020 at 11:52 AM John Dorminy &lt;<a href=3D"mailto:jdorminy@redhat.com=
" target=3D"_blank">jdorminy@redhat.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">That does make sens=
e. May I request, then, using UUID_SIZE instead of 16? Perhaps with a compi=
le-time assertion that UUID_SIZE has not change from 16?<br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 2, =
2020 at 11:10 AM Hannes Reinecke &lt;<a href=3D"mailto:hare@suse.de" target=
=3D"_blank">hare@suse.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 4/2/20 4:53 PM, John Dorminy wrote:<br>
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
</blockquote></div>

--000000000000dd658205a25444ee--

--===============5071372349080338198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5071372349080338198==--

