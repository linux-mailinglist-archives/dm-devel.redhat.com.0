Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3E528DA7
	for <lists+dm-devel@lfdr.de>; Mon, 16 May 2022 21:06:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-RBlkhzvgPjWqxmtW4k4QaA-1; Mon, 16 May 2022 15:05:58 -0400
X-MC-Unique: RBlkhzvgPjWqxmtW4k4QaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24DB0811E76;
	Mon, 16 May 2022 19:05:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F02DE40C1421;
	Mon, 16 May 2022 19:05:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37C0C194706F;
	Mon, 16 May 2022 19:05:46 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 197961947055
 for <dm-devel@listman.corp.redhat.com>; Mon, 16 May 2022 19:05:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 015371121315; Mon, 16 May 2022 19:05:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F05701121314
 for <dm-devel@redhat.com>; Mon, 16 May 2022 19:05:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C3203804522
 for <dm-devel@redhat.com>; Mon, 16 May 2022 19:05:40 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-8dVp0gJUMEOpt4kYx_EtrA-1; Mon, 16 May 2022 15:05:38 -0400
X-MC-Unique: 8dVp0gJUMEOpt4kYx_EtrA-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220516190537euoutp020d8bf5a412c99c1f6dc9302d5c4e2b9c~vq013g8sZ1645916459euoutp02N
 for <dm-devel@redhat.com>; Mon, 16 May 2022 19:05:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220516190537euoutp020d8bf5a412c99c1f6dc9302d5c4e2b9c~vq013g8sZ1645916459euoutp02N
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220516190537eucas1p1827e4dc46edb0e9fd4eef7e9067f07a0~vq01ienVy2497024970eucas1p1I;
 Mon, 16 May 2022 19:05:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 07.CC.10260.080A2826; Mon, 16
 May 2022 20:05:37 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220516190536eucas1p2ee3b60a2f6bc708919b76d35e69562a2~vq00_9hJ02269122691eucas1p28;
 Mon, 16 May 2022 19:05:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220516190536eusmtrp14da1d7baf4a6dcff2f764c9908a67164~vq00_HXpd1633216332eusmtrp1D;
 Mon, 16 May 2022 19:05:36 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-8b-6282a080c59a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D6.23.09404.080A2826; Mon, 16
 May 2022 20:05:36 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220516190536eusmtip2c5868c94ebcb947cde3c0db117dc5408~vq00zV-qZ2254722547eusmtip23;
 Mon, 16 May 2022 19:05:36 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.7) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 May 2022 20:05:34 +0100
Message-ID: <b9a02707-8628-b7de-487b-a93697e8a2cb@samsung.com>
Date: Mon, 16 May 2022 21:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: <damien.lemoal@opensource.wdc.com>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <20220516165416.171196-3-p.raghav@samsung.com>
X-Originating-IP: [106.210.248.7]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEKsWRmVeSWpSXmKPExsWy7djP87qNC5qSDGa2MlmsvtvPZvH77Hlm
 i73vZrNaXPjRyGSxcvVRJoueAx9YLPbe0ra49HgFu8WevSdZLC7vmsNmMX/ZU3aLGxOeMlqs
 ufmUxYHX49+JNWweO2fdZfe4fLbUY9OqTjaPzUvqPXbfbAAKt95n9Xi/7yqbx/otV1k8Pm+S
 C+CK4rJJSc3JLEst0rdL4MrY/uA0Y8EfuYrDCzYxNjAuk+hi5OSQEDCReLf0HUsXIxeHkMAK
 RomN/X+YIJwvjBLvry1ih3A+M0r0nO1khmlZsf8xmC0ksJxRYv4qUbii6Y/2sEI4Oxklml98
 ZwGp4hWwk/i2aQcriM0ioCqxedZ9Roi4oMTJmU/AakQFIiSmzTrDBmILC8RLfGlezw5iMwuI
 S9x6Mh/oJg4OEQE1iQ8L60DmMwu8ZpKYPGUXM0icTUBLorETrJxTwFri8opGRohWTYnW7b+h
 xshLbH87B+oBRYmbK3+xQdi1EmuPnWGHsC9xSpw4AQ0XF4krFyZA1QhLvDq+BapGRuL05B4W
 CLta4umN38wg90gItDBK9O9czwZyjwTQEX1nciBqHCXmnbnHBBHmk7jxVhDiHD6JSdumM09g
 VJ2FFBCzkDw8C8kHs5B8sICRZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZgsjv97/jX
 HYwrXn3UO8TIxMF4iFGCg1lJhNegoiFJiDclsbIqtSg/vqg0J7X4EKM0B4uSOG9y5oZEIYH0
 xJLU7NTUgtQimCwTB6dUA5OSlPKnTTOmG6u0zZw9ddGzfB2e8i7tSrXzm89WCX/ZKlM4/czF
 DQy1pzcXmO6qa5Y88Z5/z4zy2OyluySyrwm7P/bimaI94WCpw2UNSZeYZHEFSxO/hPu9p5pv
 G4enOooleXd1LOg0mbaR5WWbtUmQy4LPlX4uC++rL33ReuHrvpiiNYxvXTIX/J74XF+E5bUF
 y9rogK0ur/cITJujILV3tczx7G9nlz3+tIrj2NKSNdb7c7bvNr/Sb39mAufEG6FM/tpFy+sb
 Kxm7ujYeuPHwnqdO49fY1N+9xoLPald3zp6kepFpc7rPkX99rk87g6dsn7tot3+gJ/PbuhBZ
 9V1fyg99df8WLNqUMSN84yQlluKMREMt5qLiRACLt3n95QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42I5/e/4Pd2GBU1JBs/uSVmsvtvPZvH77Hlm
 i73vZrNaXPjRyGSxcvVRJoueAx9YLPbe0ra49HgFu8WevSdZLC7vmsNmMX/ZU3aLGxOeMlqs
 ufmUxYHX49+JNWweO2fdZfe4fLbUY9OqTjaPzUvqPXbfbAAKt95n9Xi/7yqbx/otV1k8Pm+S
 C+CK0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvY
 /uA0Y8EfuYrDCzYxNjAuk+hi5OSQEDCRWLH/MXMXIxeHkMBSRomN7VOYIBIyEp+ufGSHsIUl
 /lzrYoMo+sgosWHxPSYIZyejxI1bD5hBqngF7CS+bdrBCmKzCKhKbJ51nxEiLihxcuYTFhBb
 VCBC4sHus2A1wgLxEl+a14NtYBYQl7j1ZD7QUA4OEQE1iQ8L60DmMwu8ZpKYPGUX1Hn7GSV2
 rG8FK2IT0JJo7ATr5RSwlri8opERYo6mROv231Az5SW2v53DDPGBosTNlb/YIOxaiVf3dzNO
 YBSdheS8WUjOmIVk1CwkoxYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQITBPbjv3csoNx
 5auPeocYmTgYDzFKcDArifAaVDQkCfGmJFZWpRblxxeV5qQWH2I0BYbRRGYp0eR8YKLKK4k3
 NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgyjnx9+gPLaZLM8zrQ/ax
 ywQENiyIvd067VKoaNRld+uMnRfds571ndjPYP5p1/n6gsak2YKp12Nefj55tSQz8MXbvYvb
 Hs9dWOCx9Ox398nPJZd+PnKlSC9L4+zrOf5MfvdnJU16+jhK6jvjk0uTTspMXDNh59z/JyWi
 /QsuOeWn2p92ZuKcrdXLcPl4RGHYnYO+yzac7SqOXGhw6O3OXnY+yYRfv+Yoa9rVRXpbbCi2
 EFn8Sa1MJeL9lfM7Uv6tPLjo3/cLedtcTjc33BZ5YrV6MVdASiWfxf5p8rovZUzvLn2SvJy5
 8O1C5m06P86/O1pwcaPlRGOxtSUF8Rtr9d3nB15NnHb4aej6yFM/Ym8psRRnJBpqMRcVJwIA
 66Cj/pwDAAA=
X-CMS-MailID: 20220516190536eucas1p2ee3b60a2f6bc708919b76d35e69562a2
X-Msg-Generator: CA
X-RootMTR: 20220516165421eucas1p2515446ac290987bdb9af24ffb835b287
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220516165421eucas1p2515446ac290987bdb9af24ffb835b287
References: <20220516165416.171196-1-p.raghav@samsung.com>
 <CGME20220516165421eucas1p2515446ac290987bdb9af24ffb835b287@eucas1p2.samsung.com>
 <20220516165416.171196-3-p.raghav@samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH v4 02/13] block: allow blk-zoned devices to
 have non-power-of-2 zone size
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
 jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, dsterba@suse.com,
 dm-devel@redhat.com, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Damien,
I copied your comments from the previous thread to avoid confusion.


On 2022-05-16 16:00, Damien Le Moal wrote:
> On 2022/05/16 15:39, Pankaj Raghav wrote:
>> Checking if a given sector is aligned to a zone is a common
>> operation that is performed for zoned devices. Add
>> blk_queue_is_zone_start helper to check for this instead of opencoding it
>> everywhere.
>>
>> Convert the calculations on zone size to be generic instead of relying on
>> power_of_2 based logic in the block layer using the helpers wherever
>> possible.
>>
>> @@ -490,14 +490,29 @@ static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
>>  	 * smaller last zone.
>>  	 */
>>  	if (zone->start == 0) {
>> -		if (zone->len == 0 || !is_power_of_2(zone->len)) {
>> -			pr_warn("%s: Invalid zoned device with non power of two zone size (%llu)\n",
>> -				disk->disk_name, zone->len);
>> +		if (zone->len == 0) {
>> +			pr_warn("%s: Invalid zone size",
>> +				disk->disk_name);
>
> This fits on one line, no ?
>
Yeah. I don't know why my formatter decided to do that. I will fix it. Thanks.
>> +			return -ENODEV;
>> +		}
>> +
>> +		/*
>> +		 * Don't allow zoned device with non power_of_2 zone size with
>> +		 * zone capacity less than zone size.
>> +		 */
>> +		if (!is_power_of_2(zone->len) &&
>> +		    zone->capacity < zone->len) {
>> +			pr_warn("%s: Invalid zoned size with non power of 2 zone size and zone capacity < zone size",
>> +				disk->disk_name);
>
> Very long... What about:
>
> pr_warn("%s: Invalid zone capacity for non power of 2 zone size",
> 	disk->disk_name);
>
This looks better. I will fix it up!
>>  			return -ENODEV;
>>  		}
>>
>>  		args->zone_sectors = zone->len;
>> -		args->nr_zones = (capacity + zone->len - 1) >> ilog2(zone->len);
>> +		/*
>> +		 * Division is used to calculate nr_zones for both power_of_2
>> +		 * and non power_of_2 zone sizes as it is not in the hot path.
>> +		 */
>
> This comment is not very useful.
>

I also saw you mentioning the comment was not useful in nvme code for
a similar scenario. Hannes brought up a point about making it
explicit when we are not using any special path for power of 2 zone sizes as in
most cases we do branching if the zone size is power of 2 to avoid division.

>> +		args->nr_zones = div64_u64(capacity + zone->len - 1, zone->len);
>>  	} else if (zone->start + args->zone_sectors < capacity) {
>>  		if (zone->len != args->zone_sectors) {
>>  			pr_warn("%s: Invalid zoned device with non constant zone size\n",
>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>> index 22fe512ee..32d7bd7b1 100644
>> --- a/include/linux/blkdev.h
>> +++ b/include/linux/blkdev.h
>> @@ -686,6 +686,22 @@ static inline unsigned int blk_queue_zone_no(struct request_queue *q,
>>  	return div64_u64(sector, zone_sectors);
>>  }
>>
>> +static inline bool blk_queue_is_zone_start(struct request_queue *q, sector_t sec)
>> +{
>> +	sector_t zone_sectors = blk_queue_zone_sectors(q);
>> +	u64 remainder = 0;
>> +
>> +	if (!blk_queue_is_zoned(q))
>> +		return false;
>> +
>> +	if (is_power_of_2(zone_sectors))
>> +		return IS_ALIGNED(sec, zone_sectors);
>> +
>> +	div64_u64_rem(sec, zone_sectors, &remainder);
>> +	/* if there is a remainder, then the sector is not aligned */
>
> Hmmm... Fairly obvious. Not sure this comment is useful.
>
True. I will remove it.

>> +	return remainder == 0;
>> +}
>> +
>>  static inline bool blk_queue_zone_is_seq(struct request_queue *q,
>>  					 sector_t sector)
>>  {
>> @@ -732,6 +748,12 @@ static inline unsigned int blk_queue_zone_no(struct request_queue *q,
>>  {
>>  	return 0;
>>  }
>> +
>> +static inline bool blk_queue_is_zone_start(struct request_queue *q, sector_t sec)
>> +{
>> +	return false;
>> +}
>> +
>>  static inline unsigned int queue_max_open_zones(const struct request_queue *q)
>>  {
>>  	return 0;
>
>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

