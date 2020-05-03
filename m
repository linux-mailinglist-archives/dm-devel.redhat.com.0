Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E72A11C2CD9
	for <lists+dm-devel@lfdr.de>; Sun,  3 May 2020 15:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588513365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BddgJr7YGsr5W9Y2mgF85gkPcpzCNQjGurvQQdK6J6E=;
	b=F0RoLE7uZRldjrQVT29nlpYUb7NP7SIi4t+NIVaqpWQM4e1yBYN61rWCny15HVbjG6Kj8e
	fFDoNxTT9b0DkegZ0HJBGecdEpBntuZ+EH7u9Y4jhvJ0lJvm4oLoQbrmMZqpUqNmH4R0Ah
	5IL3znOvw2uoVcmPethwMvMY1FxfPGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-zi_oeY_sNqehiPhes5wDdQ-1; Sun, 03 May 2020 09:42:42 -0400
X-MC-Unique: zi_oeY_sNqehiPhes5wDdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D479F80058A;
	Sun,  3 May 2020 13:42:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA3755C1B2;
	Sun,  3 May 2020 13:42:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B72F1809543;
	Sun,  3 May 2020 13:42:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04372dRZ017648 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 3 May 2020 03:02:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED1DF10F8E16; Sun,  3 May 2020 07:02:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8DC510F8E15
	for <dm-devel@redhat.com>; Sun,  3 May 2020 07:02:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCD4D811E77
	for <dm-devel@redhat.com>; Sun,  3 May 2020 07:02:36 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-85-dVEqJ5hvNFCJ16FXwB3hkQ-1; Sun, 03 May 2020 03:02:33 -0400
X-MC-Unique: dVEqJ5hvNFCJ16FXwB3hkQ-1
Received: by mail-io1-f46.google.com with SMTP id y26so9062526ioj.2;
	Sun, 03 May 2020 00:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=5bMcL4rqLIlOwOorTYC7Lky7omYckEb+aQjjV9N54Cc=;
	b=C9AVYT1hwxzVCXL5bb2H+RSGtPL+QXPIjnhR188W0Y/QZygG4YUC6X/fW+bA4BrecP
	ToZjLFr25B25N8udjn5xD+G9B6QCz97AJuXzg/eg2Ss/aQQrpQBcosYYPfG1iFI7Da65
	0CQ+99pc7f8v0C3DzyHuwlhygdW3ooSg/c0TUNOnvR+//DqwFEHxvHDSvJjaaKX8QNKL
	cJCeBdr5AwvOfNB/RjR/8xN+6FsMS7KLHuETmG5IozA5yHommaYNsV0Kenp/SpD4sRFl
	/q7ivUNCpvltalnEEh21ZUAFUvtjqFuRs8j301D2gPIG4ilfrZV+AAcoh+VANimcZ7bI
	D2qw==
X-Gm-Message-State: AGi0PuY29LlZ7zqmSvwDPJM9Jyah2kqkoIHrmhiVXTMk1wz2Fne8BDlL
	a2gu3nsValcNq3OQWQZ0COLtUyvhOyoToDMIACohHu9APuM=
X-Google-Smtp-Source: APiQypJ6wAVQLiqLFLihXLh9e+ICoq9rCHS0xo02uE2Op9drBdcrJAacrR8//2iAqXGpOLHjPbpK2X2S9l8TdPlOW/I=
X-Received: by 2002:a5e:990e:: with SMTP id t14mr10734480ioj.126.1588489352857;
	Sun, 03 May 2020 00:02:32 -0700 (PDT)
MIME-Version: 1.0
From: Dongyang Zhan <zdyzztq@gmail.com>
Date: Sun, 3 May 2020 15:02:21 +0800
Message-ID: <CAFSR4cuCx-wGOAVPUPh8+V4FqDP2Nvac0OeQL6onG89JnZTpyQ@mail.gmail.com>
To: Alasdair Kergon <agk@redhat.com>, "M: Mike Snitzer" <snitzer@redhat.com>, 
	dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 03 May 2020 09:42:24 -0400
Subject: [dm-devel] Possible null pointer dereference in __rh_alloc()
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
Content-Type: multipart/mixed; boundary="===============0781338931935313827=="

--===============0781338931935313827==
Content-Type: multipart/alternative; boundary="0000000000009b4a7505a4b8ff7a"

--0000000000009b4a7505a4b8ff7a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am a security researcher, my name is Dongyang Zhan. I found a
potential bug in

/drivers/md/dm-region-hash.c in Linux 4.10.17. I hope you can help me
to confirm it.


__rh_alloc() in /drivers/md/dm-region-hash.c mishandles the memory
allocation failures of nreg.

Source code:

struct dm_region *reg, *nreg;

nreg =3D mempool_alloc(rh->region_pool, GFP_ATOMIC);
if (unlikely(!nreg))
=09=09nreg =3D kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);

nreg->state =3D rh->log->type->in_sync(rh->log, region, 1) ?
=09=09DM_RH_CLEAN : DM_RH_NOSYNC;

If the statement (nreg =3D kmalloc(sizeof(*nreg), GFP_NOIO |
__GFP_NOFAIL);) fails,
dereferencing this pointer (nreg->state) will cause null pointer dereferenc=
e.

--0000000000009b4a7505a4b8ff7a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre id=3D"gmail-m_-4853843472690211139gmail-m_-8476412448=
39025803gmail-m_4091962907303224627gmail-m_-7092909529653893599gmail-m_-855=
8348290116643165gmail-m_-7810375000073948968gmail-comment_text_0" style=3D"=
white-space:pre-wrap;font-size:medium;width:50em;color:rgb(0,0,0)">Hi,</pre=
><pre id=3D"gmail-m_-4853843472690211139gmail-m_-847641244839025803gmail-m_=
4091962907303224627gmail-m_-7092909529653893599gmail-m_-8558348290116643165=
gmail-m_-7810375000073948968gmail-comment_text_0" style=3D"white-space:pre-=
wrap;font-size:medium;width:50em;color:rgb(0,0,0)">I am a security research=
er, my name is Dongyang Zhan. I found a potential bug in </pre><pre id=3D"g=
mail-m_-4853843472690211139gmail-m_-847641244839025803gmail-m_4091962907303=
224627gmail-m_-7092909529653893599gmail-m_-8558348290116643165gmail-m_-7810=
375000073948968gmail-comment_text_0" style=3D"white-space:pre-wrap;font-siz=
e:medium;width:50em;color:rgb(0,0,0)"><span style=3D"font-family:Arial,Helv=
etica,sans-serif">/drivers/md/dm-region-hash.c</span> in Linux 4.10.17. I h=
ope you can help me to confirm it. </pre><pre id=3D"gmail-m_-48538434726902=
11139gmail-m_-847641244839025803gmail-m_4091962907303224627gmail-m_-7092909=
529653893599gmail-m_-8558348290116643165gmail-m_-7810375000073948968gmail-c=
omment_text_0" style=3D"white-space:pre-wrap;font-size:medium;width:50em;co=
lor:rgb(0,0,0)"><span style=3D"font-family:Arial,Helvetica,sans-serif"><br>=
</span></pre><pre id=3D"gmail-m_-4853843472690211139gmail-m_-84764124483902=
5803gmail-m_4091962907303224627gmail-m_-7092909529653893599gmail-m_-8558348=
290116643165gmail-m_-7810375000073948968gmail-comment_text_0" style=3D"whit=
e-space:pre-wrap;font-size:medium;width:50em;color:rgb(0,0,0)"><span style=
=3D"font-family:Arial,Helvetica,sans-serif">__rh_alloc() in /drivers/md/dm-=
region-hash.c mishandles the memory allocation failures of nreg. </span><br=
></pre><pre id=3D"gmail-m_-4853843472690211139gmail-m_-847641244839025803gm=
ail-m_4091962907303224627gmail-m_-7092909529653893599gmail-m_-8558348290116=
643165gmail-m_-7810375000073948968gmail-comment_text_0" style=3D"white-spac=
e:pre-wrap;font-size:medium;width:50em;color:rgb(0,0,0)"><pre class=3D"gmai=
l-bz_comment_text" id=3D"gmail-comment_text_0" style=3D"width:50em;white-sp=
ace:pre-wrap">Source code:

struct dm_region *reg, *nreg;

nreg =3D mempool_alloc(rh-&gt;region_pool, GFP_ATOMIC);
if (unlikely(!nreg))
=09=09nreg =3D kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);

nreg-&gt;state =3D rh-&gt;log-&gt;type-&gt;in_sync(rh-&gt;log, region, 1) ?
=09=09DM_RH_CLEAN : DM_RH_NOSYNC;

If the statement (nreg =3D kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);=
) fails,
dereferencing this pointer (nreg-&gt;state) will cause null pointer derefer=
ence.</pre>

</pre></div>

--0000000000009b4a7505a4b8ff7a--

--===============0781338931935313827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0781338931935313827==--

