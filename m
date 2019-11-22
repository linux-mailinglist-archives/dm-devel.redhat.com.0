Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4147C107974
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 21:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574454481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jGnRBuf4+10LghkPBVDeAGX50CaP7m1XxiHLbG5HuhQ=;
	b=ZaqQ6x/tAyEQOQpKmFtjX9SJCkpRF5Dtx4O7YSzMTSqmzC7RizkxZaA9AKpzi2AC8rzkpM
	qwwTOvOtwZqCkESR2qW79zvJ4agwZFroP6XVKaKv9JkLBcUpTZEFv3Iirm01Kbtt6GQPWI
	jv2HJ0anmayJLWGF79F2owVpXGLHlw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-EzJIqOruM3uJ7lF8DgQ0sA-1; Fri, 22 Nov 2019 15:27:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E162BA16B0;
	Fri, 22 Nov 2019 20:27:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 703435D6BB;
	Fri, 22 Nov 2019 20:27:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F42018095FF;
	Fri, 22 Nov 2019 20:27:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMKRLbY029258 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 15:27:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DF1B02166B2A; Fri, 22 Nov 2019 20:27:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9572157F44
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 20:27:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58A2F1011A76
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 20:27:19 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-DZZ-5Ns6ODC5dekAro1Olg-1; Fri, 22 Nov 2019 15:27:16 -0500
Received: by mail-il1-f176.google.com with SMTP id s5so8162587iln.4
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 12:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=tSJV1yUoJt/6amPyoenpF7FOQzhIIkdlocbwFFt5ct4=;
	b=LxGDHhFV4JvQ63Y7AubHr43LD8xfEPCyBbVA3RFWHtDj6/9c81JX2Qdbv/vpIqvDY+
	3523eyXEUHt9kpD7xuyxQ8FljBBDaipS+e3luH5LY/Py8a3Be/CtYLRByQucedSCaAkb
	nvjHlyzSbsgKOF2GVW6s0lWU7N2V3pWiFP6SMzjTcZ2gOFWUJNdbCDKc1n4sLoYaQtw4
	xFqqAIf2DArW34mjmTfbTWQqUecBySUZQ6mye1UpN62w2gb3LGCrmNrm0B4MvOwUGglv
	BnyTE3l5G5IwW//Xoa+Z2K9rHubHpF3PyQogRuBJFpUSnJKRbYfkh+UTzo9i0ORqUEfk
	/FWQ==
X-Gm-Message-State: APjAAAW8ijbMmD5PTTylILl1oRcUb4gVTYbv0HzFwmWFzQghY96vcBdO
	H+h/k2JP5DQmbb+Lc83G3yu3M/6QzKacpNyKZR3TCi+194w=
X-Google-Smtp-Source: APXvYqx6vsdjb93fqobkLysKYr1wibHXeYZs7k8eaiKDyCXL07GmF8+w4JhSI2HhUODKxsuXrpbC4MWu9rkq06NdzGU=
X-Received: by 2002:a92:5a0c:: with SMTP id o12mr19799090ilb.113.1574454435377;
	Fri, 22 Nov 2019 12:27:15 -0800 (PST)
MIME-Version: 1.0
From: Drew Hastings <dhastings@crucialwebhost.com>
Date: Fri, 22 Nov 2019 13:27:04 -0700
Message-ID: <CAN-y+EJOt=MRDEXCx9_U4zmDs+i9yXj364E4+z=xC=u8+Ao1PQ@mail.gmail.com>
To: dm-devel@redhat.com
X-MC-Unique: DZZ-5Ns6ODC5dekAro1Olg-1
X-MC-Unique: EzJIqOruM3uJ7lF8DgQ0sA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: [dm-devel] multipath - unable to use multiple active paths at once,
 and deprecated example in docs
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
Content-Type: multipart/mixed; boundary="===============2426868199381452598=="

--===============2426868199381452598==
Content-Type: multipart/alternative; boundary="0000000000005630f60597f53dff"

--0000000000005630f60597f53dff
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

My use case doesn't lend itself well to multipathd, so I'm trying to
implement multipathing with device mapper directly.

My table is (kernel 4.19.79):

0 1562378240 multipath 4 queue_if_no_path retain_attached_hw_handler
queue_mode bio 0 1 1 queue-length 0 4 1 253:11 1 253:8 1 253:9 1 253:10 1

What I've found with this setup is that, aside from the first path in the
group, none of the other paths receive IO/bios.

The only "real" path is 253:11, the rest of them are to dm error targets.
Still though, you can see the status of this multipath target is:

0 1562378240 multipath 2 0 0 0 1 1 A 0 4 1 253:11 A 0 309 253:8 A 0 0 253:9
A 0 0 253:10 A 0 0

So 253:11 has a queue of 309, while the rest of the devices have a queue of
zero and show an active status, indicating no IO has triggered the
underlying dm error target causing the 2nd, 3rd, and 4th paths to fail.

Before diving much deeper into the relevant kernel code, I figured I'd
check to see if there's any obvious reason this should not work the way I
expect (where individual paths are balanced within the group).

I realize that Documentation/device-mapper/dm-queue-length.txt is also
out-dated (it makes suggestions that are deprecated), but still that
documentation implies this table would balance the load. Here is the table
from those docs.

test: 0 10 multipath 0 0 1 1 queue-length 0 2 1 8:0 128 8:16 128 ( >1 is
deprecated since those docs)

My only assumption is that the multipath features, in particular queue_mode
bio, prevent this from behaving properly. If that is the case, why can this
not be achieved with bios, as this is not a limitation of raid1 (which will
load balance read IO to device mapper targets). I also believe this is the
only feature option that is viable for me, since this multipath device is
on top of device mapper targets.

The documentation would imply that the queue should be roughly the same to
every device, and that after every IO a new path is chosen for the next IO
based on the lowest entry. The code looks like it does this as described,
but maybe there's some condition preventing it from doing so (while still
counting the queue). Is there anything I can do to get this target to
behave as I assumed it would from
Documentation/device-mapper/dm-queue-length.txt ?

Also, for what it's worth, round-robin behaves the same way as queue-length=
.

Thank you for your time!
- Drew

--0000000000005630f60597f53dff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My use case doesn&#39;t lend itself well to multipathd, so=
 I&#39;m trying to implement multipathing with device mapper directly.<br><=
br>My table is (kernel 4.19.79):<br><br>0 1562378240 multipath 4 queue_if_n=
o_path retain_attached_hw_handler queue_mode bio 0 1 1 queue-length 0 4 1 2=
53:11 1 253:8 1 253:9 1 253:10 1<br><br>What I&#39;ve found with this setup=
 is that, aside from the first path in the group, none of the other paths r=
eceive IO/bios.<br><br>The only &quot;real&quot; path is 253:11, the rest o=
f them are to dm error targets. Still though, you can see the status of thi=
s multipath target is:<br><br>0 1562378240 multipath 2 0 0 0 1 1 A 0 4 1 25=
3:11 A 0 309 253:8 A 0 0 253:9 A 0 0 253:10 A 0 0 <br><br>So 253:11 has a q=
ueue of 309, while the rest of the devices have a queue of zero and show an=
 active status, indicating no IO has triggered the underlying dm error targ=
et causing the 2nd, 3rd, and 4th paths to fail.<br><br>Before diving much d=
eeper into the relevant kernel code, I figured I&#39;d check to see if ther=
e&#39;s any obvious reason this should not work the way I expect (where ind=
ividual paths are balanced within the group).<br><br>I realize that Documen=
tation/device-mapper/dm-queue-length.txt is also out-dated (it makes sugges=
tions that are deprecated), but still that documentation implies this table=
 would balance the load. Here is the table from those docs.<br><br>test: 0 =
10 multipath 0 0 1 1 queue-length 0 2 1 8:0 128 8:16 128 ( &gt;1 is depreca=
ted since those docs)<br><br>My only assumption is that the multipath featu=
res, in particular queue_mode bio, prevent this from behaving properly. If =
that is the case, why can this not be achieved with bios, as this is not a =
limitation of raid1 (which will load balance read IO to device mapper targe=
ts). I also believe this is the only feature option that is viable for me, =
since this multipath device is on top of device mapper targets.<br><br>The =
documentation would imply that the queue should be roughly the same to ever=
y device, and that after every IO a new path is chosen for the next IO base=
d on the lowest entry. The code looks like it does this as described, but m=
aybe there&#39;s some condition preventing it from doing so (while still co=
unting the queue). Is there anything I can do to get this target to behave =
as I assumed it would from Documentation/device-mapper/dm-queue-length.txt =
?<br><br>Also, for what it&#39;s worth, round-robin behaves the same way as=
 queue-length.<br><br>Thank you for your time!<br>- Drew</div>

--0000000000005630f60597f53dff--

--===============2426868199381452598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2426868199381452598==--

