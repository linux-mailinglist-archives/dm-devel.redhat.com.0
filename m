Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B78F2F5D25
	for <lists+dm-devel@lfdr.de>; Sat,  9 Nov 2019 04:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573268576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=0DXFqdfyc7T5lvsq15uzxwolz/Zzbk+ziwNCs2EcqWI=;
	b=hmip5OC/bx+AXGEurZipYr8fiX0RctTRnyDxNUE7mhr2q6IwiF55+wfB/I52QTPItpEMSQ
	60mMAZXXxag42p8AuWIZqq2bfF1tUBn0/BxToa2bUSEb0nRj31cE4a8E3BWCNmbxnXjL+I
	2eYMDr7olgIe5cbkoUVSzKoMl8JACRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-Uf9_TpNrNCWG6DRq_SHUjQ-1; Fri, 08 Nov 2019 22:02:52 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB3A801FCD;
	Sat,  9 Nov 2019 03:02:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA6C165FE;
	Sat,  9 Nov 2019 03:02:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9E034BB5C;
	Sat,  9 Nov 2019 03:02:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA932Zbi027937 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 22:02:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7EAB51001902; Sat,  9 Nov 2019 03:02:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBCD61001925;
	Sat,  9 Nov 2019 03:02:30 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE9CC3083387;
	Sat,  9 Nov 2019 03:02:29 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s10so5156408plp.2;
	Fri, 08 Nov 2019 19:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Q9w9/CL3tvrcZwNSUDDdOh70mNMnFLTdHmVRbGH/fsQ=;
	b=mWsix692Z1A9zTpNCByYVQKxsXuI2bv+7fVoWozZZTJr6WXZJ2T5cI88pFCupVrZ6D
	U39lrdvgZEPtEOzY9zdokNSHQbHsfw7D+cGldvNHh9sd8Wf3lCTMWEz9QYtkb1ZWJ8i/
	R2JR4kNWlonqRlxktCEWwLb+7g0HTo+QKIXhN2wskqCwIHzIbz4yQuZ1zN0IZH9rPR7L
	QWmEzzkOGNkV0kHhavmcs67Elo3L9i/8hU/MF7wdZ+84fyu+RikpzF8Wi4g0w/xGtrNa
	+NZxPKOmR4kZyYdZSF0SOUWK0Pv6cf1vA/1d9Wiu8cfrMsP1VbmTdaM9zST0fbkVGcmx
	AwWg==
X-Gm-Message-State: APjAAAVWztCWbHN0vb8tFHT/UpCWpqsJkPgsp8zB3sieG3NeNocp/RxZ
	r3UzAf/gR4qrSRu5utbuywRfKs4okLA=
X-Google-Smtp-Source: APXvYqznA2/Hflt4r+QC31lnQ7K+Dgy87EIN0nH4QqGDSy7xTZp2MWCmVVsOPoz64ej9OUuavrLuaw==
X-Received: by 2002:a17:902:b482:: with SMTP id
	y2mr5337175plr.128.1573268548891; 
	Fri, 08 Nov 2019 19:02:28 -0800 (PST)
Received: from localhost.localdomain ([2601:647:4000:a8:64c1:7f03:d411:a61])
	by smtp.gmail.com with ESMTPSA id d8sm6983723pfo.47.2019.11.08.19.02.27
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 08 Nov 2019 19:02:28 -0800 (PST)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, "linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-9-damien.lemoal@wdc.com>
	<6a1e0a08-d65c-b075-9bac-23519e9e91c3@acm.org>
	<BYAPR04MB5816C442BE08F9973C2CDF15E77A0@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
	mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
	LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
	fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
	AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
	3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
	AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
	igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
	Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
	jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
	macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
	CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
	RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
	PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
	eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
	lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
	T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
	++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
	CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
	oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
	//x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
	mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
	goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <639eae70-bb57-0c49-0ae9-aed8d33df271@acm.org>
Date: Fri, 8 Nov 2019 19:02:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816C442BE08F9973C2CDF15E77A0@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sat, 09 Nov 2019 03:02:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sat, 09 Nov 2019 03:02:29 +0000 (UTC) for IP:'209.85.214.196'
	DOMAIN:'mail-pl1-f196.google.com'
	HELO:'mail-pl1-f196.google.com' FROM:'bart.vanassche@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.37  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.196 mail-pl1-f196.google.com 209.85.214.196
	mail-pl1-f196.google.com <bart.vanassche@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Uf9_TpNrNCWG6DRq_SHUjQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 2019-11-08 18:54, Damien Le Moal wrote:
> On 2019/11/09 4:06, Bart Van Assche wrote:
>> On 11/7/19 5:57 PM, Damien Le Moal wrote:
>>> -=09buf =3D vzalloc(bufsize);
>>> -=09if (buf)
>>> -=09=09*buflen =3D bufsize;
>>> +=09while (bufsize >=3D SECTOR_SIZE) {
>>> +=09=09buf =3D vzalloc(bufsize);
>>> +=09=09if (buf) {
>>> +=09=09=09*buflen =3D bufsize;
>>> +=09=09=09return buf;
>>> +=09=09}
>>> +=09=09bufsize >>=3D 1;
>>> +=09}
>>
>> Hi Damien,
>>
>> Has it been considered to pass the __GFP_NORETRY flag to this vzalloc()=
=20
>> call?
>=20
> Do you mean using
>=20
> __vmalloc(bufsize,
> =09  GFP_KERNEL | __GFP_ZERO | __GFP_NORETRY, PAGE_KERNEL);
>=20
> instead of vzalloc() ? (since we cannot pass GFP flags to vzalloc()...)
>=20
> Note that this is called with GFP_NOIO set for the caller context in the
> case of revalidate zones, and default to GFP_KERNEL for
> blkdev_report_zones() unless the caller also tweaks the context memalloc
> flags.

Hi Damien,

Yes, that's what I meant. The following comment from mm/util.c explains
why __GFP_RETRY should be used if it is OK for an allocation to fail:

/*
 * We want to attempt a large physically contiguous block first because
 * it is less likely to fragment multiple larger blocks and therefore
 * contribute to a long term fragmentation less than vmalloc fallback.
 * However make sure that larger requests are not too disruptive - no
 * OOM killer and no allocation failure warnings as we have a fallback.
 */

Thanks,

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

