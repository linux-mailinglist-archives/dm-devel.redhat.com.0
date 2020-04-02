Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 33E6A19C4F7
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 16:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585839276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ABdAFNNQfWmwl4n6hI/sFZ7GWuDiSuGXsMpMNSzBrB8=;
	b=EqW2nwpDNEU9FvfU1fJsP0n9+OxpmL9yUgA3g8B3FHaxH3kmpsgArNVIzUoTuLMNv6PgJo
	lQ83zoWdQXai+TYUTGqCFnoXxpA99JpXj5oshiC7vXZAQ7eoZWV9b9gyrv2Zi1+QKfXONC
	2knV6ppReACp+wH30bf4xEWhTdYlakc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-9QsWDzlFMPCYptkSRXPn5g-1; Thu, 02 Apr 2020 10:54:31 -0400
X-MC-Unique: 9QsWDzlFMPCYptkSRXPn5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53425802563;
	Thu,  2 Apr 2020 14:54:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C599118F20;
	Thu,  2 Apr 2020 14:54:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 166DA86BE5;
	Thu,  2 Apr 2020 14:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 032EriMf002239 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Apr 2020 10:53:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9847E1006EBC; Thu,  2 Apr 2020 14:53:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C8F1006EDA
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 14:53:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B3AE800297
	for <dm-devel@redhat.com>; Thu,  2 Apr 2020 14:53:42 +0000 (UTC)
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
	[209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-146-Wje_oSPOMpWJz5f-WdMWBg-1; Thu, 02 Apr 2020 10:53:38 -0400
X-MC-Unique: Wje_oSPOMpWJz5f-WdMWBg-1
Received: by mail-ua1-f70.google.com with SMTP id u3so1283153uau.22
	for <dm-devel@redhat.com>; Thu, 02 Apr 2020 07:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=flwoJcKIQk3+QBSS4QUXTzd46/PQFktOqx/OUZjjP5Q=;
	b=rib2DVmj26SYVTJuohWjRkNYYn8LvaDjvjV2POzI8x6/uKl+9X0Vm69+aW2no9LBQa
	xlim1ZHiZdGPoVlLr6ZdK6WYY/z+dbebAioxQo/fvOXmglxttki/QjZSs9YRvRi4gN50
	2Up/GlgiliqLT8Goso1a7UIrn3+hyyBa2Mlib7JIwnTejtxGbHJWcO772e6Xs17qoKFo
	XeMFigKQW9O01aspDbXJoAtSo3OR6y/XgBRUqpVxW5EluFgs85fckGLfJPfLi9zWDZHo
	LbcCZrrkwiBtcTNrJGOCIrdf9SmjlE6zOwv+GgOJsEMMjVMPO0SxB/CwCvNAFEZGjpq9
	8K7w==
X-Gm-Message-State: AGi0PuYpg1TQAhI822lfdEPRu/KI8S3hH5b8N1QHFJ5x/Kb+bD+Xv/mB
	sOd2HqPjgCLUV1SlAhDnFW+LcHUHc/rqjgampiwEtH6DYlnVp7Lyrj5fcoApZs6+3gk8Fr66TQ7
	1QWeHMapqdtJh56bdWQnrh0j9OPPlK0c=
X-Received: by 2002:a67:7dd0:: with SMTP id y199mr2374233vsc.158.1585839217753;
	Thu, 02 Apr 2020 07:53:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7Scoxwe2fqlLaMRgybqARN7N9URdo2lizhZMGJtco06pVuBulU77XtxTSSDWCfkJeivw+Bpkdk3FpfrcKjbM=
X-Received: by 2002:a67:7dd0:: with SMTP id y199mr2374222vsc.158.1585839217554;
	Thu, 02 Apr 2020 07:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
	<93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
In-Reply-To: <93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 2 Apr 2020 10:53:26 -0400
Message-ID: <CAMeeMh82FSZm4+i2+1f89P542=3HZR6S8--yP88ZiEjYSxUveA@mail.gmail.com>
To: Bob Liu <bob.liu@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>,
	device-mapper development <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============7801092428175613009=="

--===============7801092428175613009==
Content-Type: multipart/alternative; boundary="0000000000003bc99505a24ff7e0"

--0000000000003bc99505a24ff7e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm worried about hardcoding uuid members as u8[16].

May I ask why you're not using uuid_t to define it in the on-disk
structure? It would save the casting of the uuid members to (uuid_t *)
every time you use a uuid.h function.

Possibly it is customary to use only raw datatypes on disk rather than
opaque types like uuid_t, I'm not sure. But in that case, perhaps using the
named constant UUID_SIZE instead of 16 would make the meaning clearer?

Thanks!

--0000000000003bc99505a24ff7e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I&#39;m worried about hardcoding uuid mem=
bers as u8[16].<br><br>May I ask why you&#39;re not using uuid_t to define =
it in the on-disk structure? It would save the casting of the uuid members =
to (uuid_t *) every time you use a uuid.h function.<br><br>Possibly it is c=
ustomary to use only raw datatypes on disk rather than opaque types like uu=
id_t, I&#39;m not sure. But in that case, perhaps using the named constant =
UUID_SIZE instead of 16 would make the meaning clearer?<br><br></div><div>T=
hanks!<br></div></div>

--0000000000003bc99505a24ff7e0--

--===============7801092428175613009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============7801092428175613009==--

