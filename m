Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C7F52B66C
	for <lists+dm-devel@lfdr.de>; Wed, 18 May 2022 11:40:40 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-ynn3b-saPdm1V89zhHDeDQ-1; Wed, 18 May 2022 05:40:38 -0400
X-MC-Unique: ynn3b-saPdm1V89zhHDeDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F5E985A5A8;
	Wed, 18 May 2022 09:40:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C144C15D58;
	Wed, 18 May 2022 09:40:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 56FE919264D9;
	Wed, 18 May 2022 09:40:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89ACD1947B84
 for <dm-devel@listman.corp.redhat.com>; Wed, 18 May 2022 09:40:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5F19B40CF8F0; Wed, 18 May 2022 09:40:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59DC740CF8EE
 for <dm-devel@redhat.com>; Wed, 18 May 2022 09:40:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D8C98032EA
 for <dm-devel@redhat.com>; Wed, 18 May 2022 09:40:29 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-OESEb2c5O1y4saxls5P9kQ-1; Wed, 18 May 2022 05:40:27 -0400
X-MC-Unique: OESEb2c5O1y4saxls5P9kQ-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220518094026euoutp01e76156a57a711f579b8dc5056bfeafb8~wKZ8StDEG1561215612euoutp01N
 for <dm-devel@redhat.com>; Wed, 18 May 2022 09:40:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220518094026euoutp01e76156a57a711f579b8dc5056bfeafb8~wKZ8StDEG1561215612euoutp01N
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220518094026eucas1p14f9febe6d48605bfce997c4ca867a8aa~wKZ77YK3K1913319133eucas1p1B;
 Wed, 18 May 2022 09:40:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 84.03.10009.90FB4826; Wed, 18
 May 2022 10:40:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220518094025eucas1p1a3e35a8f00348154d5ef60e61f69dfec~wKZ7bieyt1910619106eucas1p1C;
 Wed, 18 May 2022 09:40:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220518094025eusmtrp2690bb9439acf332022cabbb049548d8e~wKZ7U22Pu2765427654eusmtrp2c;
 Wed, 18 May 2022 09:40:25 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-52-6284bf09d4d0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id AA.0D.09522.90FB4826; Wed, 18
 May 2022 10:40:25 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220518094025eusmtip208fc0da8c94d9d123d11609e50d861a3~wKZ7LAhz31670016700eusmtip2h;
 Wed, 18 May 2022 09:40:25 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.7) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 May 2022 10:40:23 +0100
Message-ID: <2b169f03-11d6-9989-84cb-821d67eb6cae@samsung.com>
Date: Wed, 18 May 2022 11:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: <dsterba@suse.cz>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <20220517123008.GC18596@twin.jikos.cz>
X-Originating-IP: [106.210.248.7]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLKsWRmVeSWpSXmKPExsWy7djP87qc+1uSDM4cMbdYfbefzeL32fPM
 FnvfzWa1uPCjkcli8e/vLBYrVx9lsug58IHFYu8tbYtLj1ewW+zZe5LF4vKuOWwW85c9Zbe4
 MeEpo8Wam09ZHPg8/p1Yw+axc9Zddo/LZ0s9Nq3qZPPYvKTeY/fNBqBw631Wj/f7rrJ5rN9y
 lcXjzIIj7B6fN8kFcEdx2aSk5mSWpRbp2yVwZTT0PWEt2CRXcbzjJFsD4weJLkZODgkBE4kJ
 O/YwdjFycQgJrGCUWPt5MRuE84VR4s35I+wgVUICnxklOppLYTrOnfnFDBFfzihx/Jw/RANQ
 zexNn6FG7WSUeNCyixWkilfATuLYo3Y2EJtFQFVi95QtzBBxQYmTM5+wgNiiAhES02adAasR
 FsiSmLJtI1gvs4C4xK0n85lAbBEBUYlL+1ewgCxgFpjILDHpxWSgbRwcbAJaEo2dYJdyChhL
 rG09yQbRqynRuv03O4QtL7H97RxmiA8UJW6u/MUGYddKrD12hh1kpoTAPU6Jq7/PQxW5SFz+
 v4QRwhaWeHV8CzuELSPxfyfEQRIC1RJPb/xmhmhuYZTo37meDeQgCQFrib4zORA1jhIzHu9l
 hQjzSdx4KwhxD5/EpG3TmScwqs5CCopZSF6eheSFWUheWMDIsopRPLW0ODc9tdgwL7Vcrzgx
 t7g0L10vOT93EyMwBZ7+d/zTDsa5rz7qHWJk4mA8xCjBwawkwsuY25IkxJuSWFmVWpQfX1Sa
 k1p8iFGag0VJnDc5c0OikEB6YklqdmpqQWoRTJaJg1OqgalPhd+O73Je1X5TLlPObz8fT05U
 M2iV2mW/5Ovduivb1mqt/3Nsx7XJC6JFDJ/MmqUaduRx1GIG46AYf6cNzWrCCUwreLit9z//
 kG4v2jtD8Wqx7e2bdTVu0vYzLyXrJj74zDmxJ3jlIcsDnWtXPJ9ss3/Xec/S80XtAtvXGxp2
 CL9Q9tnSoM1/6vaH1y9DJrxMmHjrwvpigeSNL5KPXNQSS1jgW5s6882a8IY5QT5z8++XzZHv
 mtw/WUApr1Gq4aat3b8tmte75z+IYtz9zWJpYZaCobR+gc9fWZULqqrvmbatdvee7TDZVCrx
 0duaFW2fDmYeuVXFfKr92fkNMkdd/3zOnmE5xUt5uez3Qi0lluKMREMt5qLiRABuMXZT8AMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsVy+t/xe7qc+1uSDBbPF7FYfbefzeL32fPM
 FnvfzWa1uPCjkcli8e/vLBYrVx9lsug58IHFYu8tbYtLj1ewW+zZe5LF4vKuOWwW85c9Zbe4
 MeEpo8Wam09ZHPg8/p1Yw+axc9Zddo/LZ0s9Nq3qZPPYvKTeY/fNBqBw631Wj/f7rrJ5rN9y
 lcXjzIIj7B6fN8kFcEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk
 5mSWpRbp2yXoZTT0PWEt2CRXcbzjJFsD4weJLkZODgkBE4lzZ34xdzFycQgJLGWUWPfoHiNE
 Qkbi05WP7BC2sMSfa11sEEUfGSWu7z/NAuHsZJTYuKaZBaSKV8BO4tijdjYQm0VAVWL3lC3M
 EHFBiZMzn4DViApESDzYfZYVxBYWyJJ4dncH2AZmAXGJW0/mM4HYIgKiEpf2r4Ba8IJR4t7O
 OWD3MQtMZJaY9GIy0H0cHGwCWhKNnWDNnALGEmtbT7JBDNKUaN3+G2qovMT2t3OYIV5QlLi5
 8hcbhF0r8er+bsYJjKKzkNw3C8kds5CMmoVk1AJGllWMIqmlxbnpucWGesWJucWleel6yfm5
 mxiByWPbsZ+bdzDOe/VR7xAjEwfjIUYJDmYlEV7G3JYkId6UxMqq1KL8+KLSnNTiQ4ymwECa
 yCwlmpwPTF95JfGGZgamhiZmlgamlmbGSuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MysxO
 i9cVPvq+N+ltWGp05wv/qpSYo45sQv/mbJ0174TLhKLrEvpn/686/EK+Z17ZdA3TN8cLuSLk
 N/F2OHZv3mpnI9gaMXvibIHA6u9Kby+uPbvF2jvCv/nxNbFNTicDlfMn9nFXGfUKdEYc+FRj
 eunYLOvXs269CFY9Fm+ZVq8Ua/zzyw6Gkrc/65xmHZs7lZuDQ/T11O2clg7zP2f/q+TLb976
 6kVrQYRTp9ej6Z0ZzIfy5iu2KbgHsn62iJi4p13utk4Lr/vP8zuVpRnOrrj5+5LPU3OPNMHV
 p06snnng1/GIqrRdl5a+39bYGXFv9Yu4AxVChclr5kVXBqv/NPfoOxgdNLH4nIHVv213lViK
 MxINtZiLihMBD9bssacDAAA=
X-CMS-MailID: 20220518094025eucas1p1a3e35a8f00348154d5ef60e61f69dfec
X-Msg-Generator: CA
X-RootMTR: 20220516165428eucas1p1374b5f9592db3ca6a6551aff975537ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220516165428eucas1p1374b5f9592db3ca6a6551aff975537ce
References: <20220516165416.171196-1-p.raghav@samsung.com>
 <CGME20220516165428eucas1p1374b5f9592db3ca6a6551aff975537ce@eucas1p1.samsung.com>
 <20220516165416.171196-8-p.raghav@samsung.com>
 <20220517123008.GC18596@twin.jikos.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH v4 07/13] btrfs: zoned: use generic btrfs
 zone helpers to support npo2 zoned devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, pankydev8@gmail.com, gost.dev@samsung.com,
 damien.lemoal@opensource.wdc.com, jiangbo.365@bytedance.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, Luis Chamberlain <mcgrof@kernel.org>, dsterba@suse.com,
 hch@lst.de, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-05-17 14:30, David Sterba wrote:
> On Mon, May 16, 2022 at 06:54:10PM +0200, Pankaj Raghav wrote:
>> Add helpers to calculate alignment, round up and round down
>> for zoned devices. These helpers encapsulates the necessary handling for
>> power_of_2 and non-power_of_2 zone sizes. Optimized calculations are
>> performed for zone sizes that are power_of_2 with log and shifts.
>>
>> btrfs_zoned_is_aligned() is added instead of reusing bdev_zone_aligned()
>> helper due to some use cases in btrfs where zone alignment is checked
>> before having access to the underlying block device such as in this
>> function: btrfs_load_block_group_zone_info().
>>
>> Use the generic btrfs zone helpers to calculate zone index, check zone
>> alignment, round up and round down operations.
>>
>> The zone_size_shift field is not needed anymore as generic helpers are
>> used for calculation.
> 
> Overall this looks reasonable to me.
> 
>> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
>> ---
>>  fs/btrfs/volumes.c | 24 +++++++++-------
>>  fs/btrfs/zoned.c   | 72 ++++++++++++++++++++++------------------------
>>  fs/btrfs/zoned.h   | 43 +++++++++++++++++++++++----
>>  3 files changed, 85 insertions(+), 54 deletions(-)
>>
>> --- a/fs/btrfs/zoned.c
>> +++ b/fs/btrfs/zoned.c
>> @@ -1108,14 +1101,14 @@ int btrfs_reset_device_zone(struct btrfs_device *device, u64 physical,
>>  int btrfs_ensure_empty_zones(struct btrfs_device *device, u64 start, u64 size)
>>  {
>>  	struct btrfs_zoned_device_info *zinfo = device->zone_info;
>> -	const u8 shift = zinfo->zone_size_shift;
>> -	unsigned long begin = start >> shift;
>> -	unsigned long end = (start + size) >> shift;
>> +	unsigned long begin = bdev_zone_no(device->bdev, start >> SECTOR_SHIFT);
>> +	unsigned long end =
>> +		bdev_zone_no(device->bdev, (start + size) >> SECTOR_SHIFT);
> 
> There are unsinged long types here though I'd rather see u64, better for
> a separate patch. Fixed width types are cleaner here and in the zoned
> code as there's always some conversion to/from sectors.
> 
Ok. I will probably send a separate patch to convert them to fix width
types. Is it ok if I do it as a separate patch instead of including it
in this series?
>>  	u64 pos;
>>  	int ret;
>>  
>> -	ASSERT(IS_ALIGNED(start, zinfo->zone_size));
>> -	ASSERT(IS_ALIGNED(size, zinfo->zone_size));
>> +	ASSERT(btrfs_zoned_is_aligned(start, zinfo->zone_size));
>> +	ASSERT(btrfs_zoned_is_aligned(size, zinfo->zone_size));
>>  
>>  	if (end > zinfo->nr_zones)
>>  		return -ERANGE;
>> --- a/fs/btrfs/zoned.h
>> +++ b/fs/btrfs/zoned.h
>> @@ -30,6 +30,36 @@ struct btrfs_zoned_device_info {
>>  	u32 sb_zone_location[BTRFS_SUPER_MIRROR_MAX];
>>  };
>>  
>> +static inline bool btrfs_zoned_is_aligned(u64 pos, u64 zone_size)
>> +{
>> +	u64 remainder = 0;
>> +
>> +	if (is_power_of_two_u64(zone_size))
>> +		return IS_ALIGNED(pos, zone_size);
>> +
>> +	div64_u64_rem(pos, zone_size, &remainder);
>> +	return remainder == 0;
>> +}
>> +
>> +static inline u64 btrfs_zoned_roundup(u64 pos, u64 zone_size)
>> +{
>> +	if (is_power_of_two_u64(zone_size))
>> +		return ALIGN(pos, zone_size);
> 
> Please use round_up as the rounddown helper uses round_down
> 
Ah, good catch. I will use it instead. Thanks.
>> +
>> +	return div64_u64(pos + zone_size - 1, zone_size) * zone_size;
>> +}
>> +
>> +static inline u64 btrfs_zoned_rounddown(u64 pos, u64 zone_size)
>> +{
>> +	u64 remainder = 0;
>> +	if (is_power_of_two_u64(zone_size))
>> +		return round_down(pos, zone_size);
>> +
>> +	div64_u64_rem(pos, zone_size, &remainder);
>> +	pos -= remainder;
>> +	return pos;
>> +}
>> +
>>  #ifdef CONFIG_BLK_DEV_ZONED
>>  int btrfs_get_dev_zone(struct btrfs_device *device, u64 pos,
>>  		       struct blk_zone *zone);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

