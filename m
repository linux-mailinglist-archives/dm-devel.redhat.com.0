Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 700B151FAEA
	for <lists+dm-devel@lfdr.de>; Mon,  9 May 2022 13:06:39 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-Awp19srcOX-8U9UxUZkxkg-1; Mon, 09 May 2022 07:06:35 -0400
X-MC-Unique: Awp19srcOX-8U9UxUZkxkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E484800B21;
	Mon,  9 May 2022 11:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55791432110;
	Mon,  9 May 2022 11:06:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95FE61947063;
	Mon,  9 May 2022 11:06:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A4B41947052
 for <dm-devel@listman.corp.redhat.com>; Mon,  9 May 2022 11:06:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 270941468D67; Mon,  9 May 2022 11:06:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 228C31468D66
 for <dm-devel@redhat.com>; Mon,  9 May 2022 11:06:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B4D229AB3E2
 for <dm-devel@redhat.com>; Mon,  9 May 2022 11:06:30 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-u-FSjlUXNWuhtePW7QHlnw-1; Mon, 09 May 2022 07:06:27 -0400
X-MC-Unique: u-FSjlUXNWuhtePW7QHlnw-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220509110626euoutp0132d2ee0e164724156beaf06404c85552~taxdV2iJR0065300653euoutp01W
 for <dm-devel@redhat.com>; Mon,  9 May 2022 11:06:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220509110626euoutp0132d2ee0e164724156beaf06404c85552~taxdV2iJR0065300653euoutp01W
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220509110625eucas1p1f964acbddfe7891b98f63e6ff7fc0b07~taxcm_e4G1538615386eucas1p14;
 Mon,  9 May 2022 11:06:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5B.E0.10260.1B5F8726; Mon,  9
 May 2022 12:06:25 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220509110625eucas1p243f900c817606c7e5c9b2118694bd775~taxcKNU2F0280002800eucas1p2u;
 Mon,  9 May 2022 11:06:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220509110624eusmtrp2ddefeac67b6ec0e261a9a0128a1eb6bb~taxcI4G4X1743917439eusmtrp2B;
 Mon,  9 May 2022 11:06:24 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-95-6278f5b1cb1e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 46.B3.09522.0B5F8726; Mon,  9
 May 2022 12:06:24 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220509110624eusmtip15754ef24a5e25ae9d009ed4324ccbd42~taxb8LugR1905219052eusmtip1Z;
 Mon,  9 May 2022 11:06:24 +0000 (GMT)
Received: from [106.110.32.130] (106.110.32.130) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 May 2022 12:06:23 +0100
Message-ID: <aef68bcf-4924-8004-3320-325e05ca9b20@samsung.com>
Date: Mon, 9 May 2022 13:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>, <jaegeuk@kernel.org>,
 <hare@suse.de>, <dsterba@suse.com>, <axboe@kernel.dk>, <hch@lst.de>,
 <snitzer@kernel.org>
From: Pankaj Raghav <p.raghav@samsung.com>
In-Reply-To: <39a80347-af70-8af0-024a-52f92e27a14a@opensource.wdc.com>
X-Originating-IP: [106.110.32.130]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGc+693N4Wkduq6RkQzTpnnNuYOown05G5LcsdfsQYMXNqoMBN
 ISvFtYA4wywUDKKD0ijTwoI4lALdClQpMKhblaIIK4zBWBWFjSZdFYTxIaYoo7248N/v/Xje
 87xvDoWL6skQKkmRyioVUrmEFBAN9meOt+umM+I23sqGyNRhx9F8i51ENYOFJCoef4YjXeEF
 HvJ2OXDUOlYSgLpnszDUclmHoaqaNgyNmPQ4OvvzOIGqcoZxNDe8CQ1POQmks/UD5OrTY6jV
 +Sb67W8DD7W03iFQb3MpicquunhIe2oaRwNaF0BF7eYA9OOjJwS67Qz9IJTp/X0n8+K2kWSK
 NGM8xvGgjmB6u9KY+urTJFOuPo8z5oqTzE9/qknmG80YyTTlPgxgnlj7SMZ0rY9gzHdPMFpz
 XQAzWb96r/BzwfYEVp6UzirfiYwVJD613cSPugIz+q3ZmBo85OcDPgXpCHi+S4v5WEQbAByc
 T88HggWeAjC7yQK4YBLA0jNT2EvFhe4zi4VKALutbeT/XdZfhgkuaAbwltfilwTRkdBknCN8
 TNBrYc5oMcnlhfDOxRF/fhX9GSzWd/rzK+go+MdMpV+L02LoHCnDfENX0tUAGh95/c/h9JUA
 WNtoXahQFElvgFmneT4Bn/4ETv36D8mJ34C5Fi+P4zXQMlqK+9ohLYElveHcOpnwB3snj2O3
 AHrzAjn+GDrb/iU5XgE97dcWe8LgfFPZ4ilOQNeAF/fZgXQOgIVNJpKbvw0WdMo53AGtV1dz
 uBwOjAo5M8uhruFbXAte1y85hH7Jwvol/vVL/F8CRDUQs2mqZBmrelfBHgtXSZNVaQpZeHxK
 cj1Y+NZ3X7RPNwKDZyLcBjAK2ACkcMnKoBsFGXGioATp8a9YZUqMMk3OqmwglCIk4qD4pFqp
 iJZJU9kvWPYoq3xZxSh+iBp776D96+uK5uM0Ey5mD8WEWgZmgo3ijl3OvwTrK2XP712UJ5zK
 rAiOkD9/i/Ekkq6SAgE/unTblcRXXvuI3NxSfq5KZhq6d7nj5JqzZGxVvm7C3pDnJg7X3p/V
 l2yNFhob8O9Q5Pgez6rvH18KKRE1ut0VT+tHJvaODRllxdbk7Kj1yCDK6lvWrz5goGZ25l7v
 HnJmKmL3JQTPlYYZzXOdj29GHQpbZzhitMXHfRqbZDZbRMdqjuxHeV/ucEfv2j7ZHNGTMnn/
 /YYtu/cNxm19IE+NfjU9h5cyLMw9uLlI07N24+79e9zQk3/Y0RMYo1n2YU9jRbBpi7S8Td/k
 0NyYlRCqROmmDbhSJf0POI01VEUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxiHc3pvbwuzei0wTsCoa7Ylc7ZQpN3pBoy4BS/iEhKzubhsWOCu
 kLUU+uGYY1lBREGZtImIRXCArshXpSWofE3bDWQEQcvHhGglo7pBKOAU11FxlGYJ/z3nPef8
 3uecvGyM+yczjJ2ZpaFVWVI5jwjEB1b67vOvPMtNjZy8I0bm33ox9LKrl0CN908TqHzBgyHD
 6QoWWh4cwlC3u5KJhv/JZ6CuWgMDXW78lYGmzUYMnbqxgKPLhVMY8k4J0dTTCRwZbGMAuUaN
 DNQ98Ta6+0c9C3V19+PI0XGeQBd+crFQWdEzDP1e5gJI32dlopbZeRzdmgiPD6ccI0nUyq0m
 gtIfdbOooQetOOUY1FKWhmKCqtGdwSjrxe+pzns6gio96iao68ecTGq+Z5SgzG2jOGUd+JYq
 s7Yyqb8tW5M3HxTEqJRaDb09Q6nWxPI+E6IogVCCBFHREoFw1zufvxsl4kXExaTT8szDtCoi
 7pAg47nNjmW7Xskd6ylg6IAzoAQEsCEZDSuGT4ISEMjmkpcA1JW+YPg3tsAnI4ssPwdB71gJ
 4WMuuQhgnYfn5w4AR0ZEPuaQcdDc5MV9jJOvw8K5csJf3wz7z02v1UPIT+HDzkGmj4PIvXB8
 ybTWCyND4cT0BYZPIphsALBpdpnwLTCyjgnvVLpZfr1/ASy4Ob7qymYT5A6YX7xmF0AmwKe3
 /yL8SW/BY1eXWX7eBq/Oncd8xyHJg5UOgf8x38EZZycoAyHGdX7GdR7GdUnGdUk/ArwBBNNa
 tUKmUAsFaqlCrc2SCdKUCgtYHbn2Xo/1GqieWRTYAIMNbACyMV4w5+cfclO5nHTpN0dolTJF
 pZXTahsQrX6SHgsLSVOuzmyWJkUojhQJo8WSSJFEvIsXyknMPiHlkjKphv6KprNp1f/3GOyA
 MB2jNSf+4KEvlvaMGVpKWe/rHUW2TlPS9sOS5BqXvXlTeOLGgbyqXI/pzef7Y/N/kdXzF1bq
 7Eytg3/DXl2c6lraP9N4r8J0KtawGPrgoqV2st84uxfzvHritQ+R4WT72Z7WHE6BqTpBP7+b
 L9l3/Uhec9Uo+YjsU8V8MPlxoHd8wfF14XH3w/aitNkqaYdXvpPzZdFOo2ROzX3jQJBTI2sT
 iZP4zZE55tq03R309BV5cvt7ETbFk3qtqlExZGm6+WifNvb2prDHL3Mqjl8bSK87N84s3zB1
 90C0kQRnX8QnMjeCYWdtuGJb29YtKTW2DS0Jez6y45f0j/NkmcDxiYbNw9UZUuEOTKWW/gf+
 NzBQ+wMAAA==
X-CMS-MailID: 20220509110625eucas1p243f900c817606c7e5c9b2118694bd775
X-Msg-Generator: CA
X-RootMTR: 20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098
References: <20220506081105.29134-1-p.raghav@samsung.com>
 <CGME20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098@eucas1p2.samsung.com>
 <20220506081105.29134-11-p.raghav@samsung.com>
 <39a80347-af70-8af0-024a-52f92e27a14a@opensource.wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH v3 10/11] null_blk: allow non power of 2
 zoned devices
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, bvanassche@acm.org,
 Luis Chamberlain <mcgrof@kernel.org>, gost.dev@samsung.com,
 Josef Bacik <josef@toxicpanda.com>, linux-nvme@lists.infradead.org,
 jiangbo.365@bytedance.com, Jens Axboe <axboe@fb.com>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, linux-btrfs@vger.kernel.org,
 Alasdair Kergon <agk@redhat.com>, jonathan.derrick@linux.dev,
 linux-fsdevel@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Johannes Thumshirn <jth@kernel.org>, Keith Busch <kbusch@kernel.org>,
 matias.bjorling@wdc.com, Sagi Grimberg <sagi@grimberg.me>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


>> diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
>> index 5cb4c92cd..ed9a58201 100644
>> --- a/drivers/block/null_blk/main.c
>> +++ b/drivers/block/null_blk/main.c
>> @@ -1929,9 +1929,8 @@ static int null_validate_conf(struct nullb_device *dev)
>>  	if (dev->queue_mode == NULL_Q_BIO)
>>  		dev->mbps = 0;
>>  
>> -	if (dev->zoned &&
>> -	    (!dev->zone_size || !is_power_of_2(dev->zone_size))) {
>> -		pr_err("zone_size must be power-of-two\n");
>> +	if (dev->zoned && !dev->zone_size) {
>> +		pr_err("zone_size must not be zero\n");
> 
> May be a simpler phrasing would be better:
> 
> pr_err("Invalid zero zone size\n");
> 
Ack. I will change this in the next rev.
>>  		return -EINVAL;
>>  	}
>>  
>> diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
>> index dae54dd1a..00c34e65e 100644
>> --- a/drivers/block/null_blk/zoned.c
>> +++ b/drivers/block/null_blk/zoned.c
>> @@ -13,7 +13,10 @@ static inline sector_t mb_to_sects(unsigned long mb)
>>  
>>  static inline unsigned int null_zone_no(struct nullb_device *dev, sector_t sect)
>>  {
>> -	return sect >> ilog2(dev->zone_size_sects);
>> +	if (is_power_of_2(dev->zone_size_sects))
>> +		return sect >> ilog2(dev->zone_size_sects);
> 
> As a separate patch, I think we should really have ilog2(dev->zone_size_sects)
> as a dev field to avoid doing this ilog2 for every call..
> 
I don't think that is possible because `zone_size_sects` can also be non
po2.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

