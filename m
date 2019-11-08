Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B494AF547C
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 20:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573240046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QRlnRuCjXfLSRfygPsgGnhLfCa2i7+X4Hf+FhcpErLM=;
	b=d6ThI3i8Q4++AUTuxcnulT14MaMzhxME8ciV2m8AYnDmlpXifMY1cPZXJ+YAFjV0nv6luX
	/H+/QaBAxI2FFv7xD+SoVOfJm442umbKjfbpJ8C4N+AWAcLH61cPXj1lWy5tvw8Glixi0E
	AvsKwh8OqGGMl2Lp3uS1a66NLTMF9EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-4bmgsasBPvqVrmG0tXTPtQ-1; Fri, 08 Nov 2019 14:07:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B47B1477;
	Fri,  8 Nov 2019 19:07:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C13C8600CA;
	Fri,  8 Nov 2019 19:07:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0993B4BB65;
	Fri,  8 Nov 2019 19:07:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8J6kAF028059 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 14:06:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 17F215D70E; Fri,  8 Nov 2019 19:06:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E538A5D6BB;
	Fri,  8 Nov 2019 19:06:35 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05F49190C032;
	Fri,  8 Nov 2019 19:06:35 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j12so4480505plt.9;
	Fri, 08 Nov 2019 11:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KUO65dsRHtTENunurXMA0yCDuIh5HnQm2qnH0n9rKZk=;
	b=SoQ3SNEvTc+KE628Ws8WkbvBsQxWVDXBua8dDicQMujJ6cqx0Ic3TEI/TLtMuO1bkN
	RlZLiEZzF6MhcZFR0YwTbN7h83ihSyA+0BnMlKM1HjgnkJxvGGrfzEwxsFnAl9eV0WD8
	Xb8h41CUSecf3tea4vWU506UGPCI2Ynf8tfKGt1saohsvYmDSROEq+1+xXBUoopA99bG
	SrW4mCLaN4ydgi+GjU3FZLSrXjEqrC+b1sM7w0zHR5CbF0ORKubcNWYSM4/DZuH1mLGx
	V/SlpiVuY/l3DQf4bsKY+8jARaTLoKKLf5gRK1hFOAbYhy7jscGtxMAfulPTnhoaYtzP
	b8Qw==
X-Gm-Message-State: APjAAAX3atzNMu3Rss/2vyxYWhm5xX0J3SShCYTiDlr9aIO/To2UiHFb
	ie8GFAouhK0vdhMEDAHr40DvMA2a7vM=
X-Google-Smtp-Source: APXvYqyIA6IZIhFAL8yKUMxwryNfWoTyBGgHonMtuaTj6pITXvKw5p2xICH26JJvC0HNVp5O2BuxpQ==
X-Received: by 2002:a17:902:d217:: with SMTP id
	t23mr12191406ply.287.1573239994227; 
	Fri, 08 Nov 2019 11:06:34 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
	([2620:15c:2cd:202:4308:52a3:24b6:2c60])
	by smtp.gmail.com with ESMTPSA id
	a16sm7196444pfc.56.2019.11.08.11.06.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 08 Nov 2019 11:06:33 -0800 (PST)
To: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-9-damien.lemoal@wdc.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <6a1e0a08-d65c-b075-9bac-23519e9e91c3@acm.org>
Date: Fri, 8 Nov 2019 11:06:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108015702.233102-9-damien.lemoal@wdc.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Fri, 08 Nov 2019 19:06:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Fri, 08 Nov 2019 19:06:35 +0000 (UTC) for IP:'209.85.214.195'
	DOMAIN:'mail-pl1-f195.google.com'
	HELO:'mail-pl1-f195.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.37  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.195 mail-pl1-f195.google.com 209.85.214.195
	mail-pl1-f195.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 8/9] scsi: sd_zbc: Cleanup
 sd_zbc_alloc_report_buffer()
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
X-MC-Unique: 4bmgsasBPvqVrmG0tXTPtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11/7/19 5:57 PM, Damien Le Moal wrote:
> -=09buf =3D vzalloc(bufsize);
> -=09if (buf)
> -=09=09*buflen =3D bufsize;
> +=09while (bufsize >=3D SECTOR_SIZE) {
> +=09=09buf =3D vzalloc(bufsize);
> +=09=09if (buf) {
> +=09=09=09*buflen =3D bufsize;
> +=09=09=09return buf;
> +=09=09}
> +=09=09bufsize >>=3D 1;
> +=09}

Hi Damien,

Has it been considered to pass the __GFP_NORETRY flag to this vzalloc()=20
call?

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

