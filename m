Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF27245A6
	for <lists+dm-devel@lfdr.de>; Tue,  6 Jun 2023 16:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686061217;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4/QKhp/HxbKXPg/k64swn1gfSpwo0tYrrZG9ca+vi78=;
	b=JBNDhQe0jWuN7oBoi5qV/LXRLIZf17Dw5W7ZWlYu/9/m66BukXQUFCOexFpZK4ia639b7X
	attNIWDQJrskn4T9l5qZbe73uxMXizInA4M3Cj5ElT8pSANboqQY+qooZsVChFCVz/DG9y
	u2LRFDFHDTE20oDnBa9P2cyQxpXmXf4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-VBWG34HSOeawA6K-d64hJA-1; Tue, 06 Jun 2023 10:20:14 -0400
X-MC-Unique: VBWG34HSOeawA6K-d64hJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B28C23C0ED6F;
	Tue,  6 Jun 2023 14:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01E6B1121314;
	Tue,  6 Jun 2023 14:19:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBB7919452C4;
	Tue,  6 Jun 2023 14:19:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E79D19465BA
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Jun 2023 14:19:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F3537AE4; Tue,  6 Jun 2023 14:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 660C89E8E
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 14:19:48 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 352DD18AE963
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 14:19:35 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-wkIqKpHBOw-hSyULYmpNjA-1; Tue, 06 Jun 2023 10:19:19 -0400
X-MC-Unique: wkIqKpHBOw-hSyULYmpNjA-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230606141912epoutp03a0fedb3e1ed2972fdbc045d56b018888~mF69rGyie0339703397epoutp03G
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 14:19:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230606141912epoutp03a0fedb3e1ed2972fdbc045d56b018888~mF69rGyie0339703397epoutp03G
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230606141911epcas5p3feaf4868278ede2a218037055402778a~mF68ppvKo0226602266epcas5p3G;
 Tue,  6 Jun 2023 14:19:11 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QbCJt3gbnz4x9Pp; Tue,  6 Jun
 2023 14:19:10 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 ED.0D.04567.E504F746; Tue,  6 Jun 2023 23:19:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230606113849epcas5p20436fd9c3a47354fc4f5264540cd9887~mDu7kpk5C1243112431epcas5p2V;
 Tue,  6 Jun 2023 11:38:49 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230606113849epsmtrp1037164b0d5a6cfbe44a01819ba98ed2b~mDu7i-Kls0420604206epsmtrp1I;
 Tue,  6 Jun 2023 11:38:49 +0000 (GMT)
X-AuditID: b6c32a49-943ff700000011d7-f9-647f405ec85f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.47.28392.9CA1F746; Tue,  6 Jun 2023 20:38:49 +0900 (KST)
Received: from green245 (unknown [107.99.41.245]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20230606113842epsmtip230b93d2fae8d0d35d5b4cfcfbf869ead~mDu1DVgJ-2435324353epsmtip29;
 Tue,  6 Jun 2023 11:38:42 +0000 (GMT)
Date: Tue, 6 Jun 2023 17:05:35 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230606113535.rjbhe6eqlyqk4pqq@green245>
MIME-Version: 1.0
In-Reply-To: <ZH3mjUb+yqI11XD8@infradead.org>
User-Agent: NeoMutt/20171215
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1STZRzHz/O+493QZq9c6nGUcN44JtiAGeADSKChvQEVzTpd/gB2tvcw
 AradjYlmHW4KAnJRWycWxEUuAiUIZBNEcURDkYAQCPJCBmgQ90MoKLS50fG/z/P9/b7P7/n9
 fufh4DZX2TxOtCyeUcpEsRSxgXWhzWU7PzwwUeJRnmmHaq//gqOUvCc4qrmdS6DJtnmAvp59
 hKPR1nSA+kY3oZErAahl+lsrNNR6EUOXSk9hqDOvFENVNe0Yai6Zw9BftxbYqH1tikCn9AMA
 jfVrMdQyvAOVpJWx0KWWayzU11RAoKKKMTbKGtQRqNKwiiH96VQM6UaTATo3OcNCHcMOqPuJ
 wQqtPCwgAh3pvpshtPZuF0Ff1N5m0913zrPohrOudF+Xmq6vziDohrJEunkoiaDP5Jy2orNT
 pwl6bmyYRc9c7ifonMZqQDd0HqEX6reGbf40ZreUEUkYpRMjE8sl0bIofyrkQMSbEV7eHgK+
 wAftopxkojjGnwoKDePvj441DotyOiiKVRulMJFKRbm/sVspV8czTlK5Kt6fYhSSWIWnwk0l
 ilOpZVFuMibeV+DhsdPLmBgZIzUMlrIVDQ6HBpYfWiWBKy9kAmsOJD1hT2EFy8Q2ZDOAustv
 ZYINRp4HMD9LA8yHBQCLu/uxdcdEVwZhDjQB2N8+ZMkaB3B5rR2YslikM2w7M2d0cDgEuQN2
 rnFMsh3pAocr03ET42Q1G7auUia2Jf3gyODkU51LesM/0qosvBleyx9lma6xJvlwOPsjk2xP
 vgS/KV/ETWUh+a81LO4xtwDJIFjSfhI3sy2cMDSyzcyDf+emWTgBVn11ljCbjwKoHdQCcyAA
 Hruea3mcFJb0j1v0l6Hm+jnMrG+C2Sujlklwoe67dX4Ffl9bTJh5CxxYSrYwDc/3PLZM6x6A
 bSl6LA84ap9pTvtMPTP7wozZFCutsWmcdICVqxwzusDaJvdiYFUNtjAKVVwUo/JSCGRMwv8L
 F8vj6sHTv+T6tg7cHpl10wOMA/QAcnDKjvtZQKLEhisRHf6cUcojlOpYRqUHXsZdncR59mK5
 8TPK4iMEnj4ent7e3p4+r3sLqBe5r/pfE9uQUaJ4JoZhFIxy3YdxrHlJGHK4eKFWfMc2fJnn
 5yzgCJMNB/bZP256b3DJdwCbC+w3iBxDHgiXeoM9uxf9Auq8KiUYN0WhGj9xaT6O3Lq2Udgb
 Tsn5edJmeye+5uO6LKFPTfmhB7d0E9s60MC+XceL7FM06SNTWWq334lk/s8rFUKe+7bUHu6j
 9B9GkjUn6HcTZB/8s1odmX/0tRs81nxP4dXf9nwZoqZCe9N6/YV2+p2FU6HHfrxboJvR7V3I
 HZ2ua5wUf7gH3P9kY2pZuziHf397/g2NRurc4WbI/fMWCH4nKPL9sKidrUXJVZ0d+MzzB8ti
 vgheFFXcvGc35PTcfuGuw4yj8CdSefwI8WtE3VoYxVJJRQJXXKkS/Qe0f8wY1AQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZdlhJXvekVH2KwYpt8hbrTx1jtmia8JfZ
 YvXdfjaL14c/MVpM+/CT2eLJgXZGi8tP+Cwe7Le32PtuNqvFzQM7mSz2LJrEZHF6wiImi5Wr
 jzJZ7F74kcni8Z3P7BZH/79ls5h06BqjxdOrs5gs9t7StljYtoTFYs/ekywWl3fNYbOYv+wp
 u0X39R1sFsuP/2OyODS5mclix5NGRot1r9+zWJy4JW1x/u9xVovfP+awOch7XL7i7THr/lk2
 j52z7rJ7nL+3kcVj8wotj8tnSz02repk89i8pN5j980GNo/FfZNZPXqb37F5fHx6i8Xj/b6r
 bB59W1Yxemw+Xe3xeZNcgGAUl01Kak5mWWqRvl0CV8afTztYC55KVBx5vZi5gbFbpIuRk0NC
 wETi1dlONhBbSGAHo8SvmxYQcUmJZX+PMEPYwhIr/z1n72LkAqp5wihx9vpeFpAEi4CKxOHF
 H5m6GDk42AS0JU7/5wAJiwhoStxa3s4MUs8ssI5d4uvWa2CDhAWsJR5cfw1m8wqYSdxuW8kM
 MfQRo8T/I8ugEoISJ2c+AVvADFQ0b/NDZpAFzALSEsv/cYCYnAK6Erd6w0EqRAVkJGYs/co8
 gVFwFpLmWUiaZyE0L2BkXsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJEZxMtLR2MO5Z
 9UHvECMTB+MhRgkOZiUR3l1e1SlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnN
 Tk0tSC2CyTJxcEo1MLU+OaWufuTyRoVPCv08vlE7nq07MuF4bcMm/o60vvMlbcm7Pl/1mLd9
 ztH9l+72c6ee+DXFKzvLa+ZxCT/JZIblbzofX2vVkWUO0L/6SClK5h6Xs/ilnIlPQ9XXn3vq
 az1NPSqi7N2O30XznC8Hlk7YfTvg9nRR5xtOV+4Giql2/vgsmRWz+OOxyODJgvZWjS8c5py8
 fTj96Y+iY/HVKw/4199n3rhRdOf3isRqnWVybZllKaqa1/bfevKp3m99aAznpTviSy66L308
 TyX0j4DyhcYmmVbBc4zz9NRN+5Z379TodNuh9HDxt9N7zy5+5bJ37v2m09OYj1kk+FwXNmN1
 bHg75X/8fTv5DyZ9PSFKLMUZiYZazEXFiQAmhJ86lQMAAA==
X-CMS-MailID: 20230606113849epcas5p20436fd9c3a47354fc4f5264540cd9887
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230605122310epcas5p4aaebfc26fe5377613a36fe50423cf494
References: <20230605121732.28468-1-nj.shetty@samsung.com>
 <CGME20230605122310epcas5p4aaebfc26fe5377613a36fe50423cf494@epcas5p4.samsung.com>
 <20230605121732.28468-6-nj.shetty@samsung.com>
 <ZH3mjUb+yqI11XD8@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH v12 5/9] nvme: add copy offload support
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
Cc: linux-doc@vger.kernel.org, djwong@kernel.org,
 linux-nvme@lists.infradead.org, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, gost.dev@samsung.com,
 nitheshshetty@gmail.com, James Smart <james.smart@broadcom.com>,
 willy@infradead.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Mike Snitzer <snitzer@kernel.org>,
 ming.lei@redhat.com, linux-block@vger.kernel.org, dlemoal@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Keith Busch <kbusch@kernel.org>,
 bvanassche@acm.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Kanchan Joshi <joshi.k@samsung.com>,
 martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Javier =?utf-8?B?R29uesOhbGV6?= <javier.gonz@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: multipart/mixed;
 boundary="----JBF_njb0NWiSS48ThI00c_Y9Zxz.JAos93qymBy6wSZnW6dc=_4db83_"

------JBF_njb0NWiSS48ThI00c_Y9Zxz.JAos93qymBy6wSZnW6dc=_4db83_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On 23/06/05 06:43AM, Christoph Hellwig wrote:
>>  		break;
>>  	case REQ_OP_READ:
>> -		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_read);
>> +		if (unlikely(req->cmd_flags & REQ_COPY))
>> +			nvme_setup_copy_read(ns, req);
>> +		else
>> +			ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_read);
>>  		break;
>>  	case REQ_OP_WRITE:
>> -		ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_write);
>> +		if (unlikely(req->cmd_flags & REQ_COPY))
>> +			ret = nvme_setup_copy_write(ns, req, cmd);
>> +		else
>> +			ret = nvme_setup_rw(ns, req, cmd, nvme_cmd_write);
>
>Yikes.  Overloading REQ_OP_READ and REQ_OP_WRITE with something entirely
>different brings us back the horrors of the block layer 15 years ago.
>Don't do that.  Please add separate REQ_COPY_IN/OUT (or maybe
>SEND/RECEIVE or whatever) methods.
>

Downside will be duplicating checks which are present for read, write in
block layer, device-mapper and zoned devices.
But we can do this, shouldn't be an issue.

>> +	/* setting copy limits */
>> +	if (blk_queue_flag_test_and_set(QUEUE_FLAG_COPY, q))
>
>I don't understand this comment.
>

It was a mistake. Comment is misplaced and it should have been
"setting copy flag" instead of "setting copy limits".
Anyway now we feel this comment is redundant, will remove it.
Also, we should have used blk_queue_flag_set to enable copy offload.

>> +struct nvme_copy_token {
>> +	char *subsys;
>> +	struct nvme_ns *ns;
>> +	sector_t src_sector;
>> +	sector_t sectors;
>> +};
>
>Why do we need a subsys token?  Inter-namespace copy is pretty crazy,
>and not really anything we should aim for.  But this whole token design
>is pretty odd anyway.  The only thing we'd need is a sequence number /
>idr / etc to find an input and output side match up, as long as we
>stick to the proper namespace scope.
>

The idea behind subsys is to prevent copy across different subsystem.
For example, copy across nvme subsystem and the scsi subsystem. [1]
At present, we don't support inter-namespace(copy across NVMe namespace),
but after community feedback for previous series we left scope for it.
About idr per namespace, it will be similar to namespace check that
we are doing to prevent copy across namespace.
We went with current structure for token, as it was solving above
issues as well as provides a placeholder for storing source LBA and
number of sectors.
Do have any suggestions on how we can store source info, if we go with
idr based approach ?

[1] https://lore.kernel.org/all/alpine.LRH.2.02.2202011327350.22481@file01.intranet.prod.int.rdu2.redhat.com/T/#m407f24fb4454d35c3283a5e51fdb04f1600463af

>> +	if (unlikely((req->cmd_flags & REQ_COPY) &&
>> +				(req_op(req) == REQ_OP_READ))) {
>> +		blk_mq_start_request(req);
>> +		return BLK_STS_OK;
>> +	}
>
>This really needs to be hiden inside of nvme_setup_cmd.  And given
>that other drivers might need similar handling the best way is probably
>to have a new magic BLK_STS_* value for request started but we're
>not actually sending it to hardware.

Sure we will add new BLK_STS_* for completion and move the snippet.

Thank you,
Nitesh Shetty

------JBF_njb0NWiSS48ThI00c_Y9Zxz.JAos93qymBy6wSZnW6dc=_4db83_
Content-Type: text/plain; charset="utf-8"


------JBF_njb0NWiSS48ThI00c_Y9Zxz.JAos93qymBy6wSZnW6dc=_4db83_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

------JBF_njb0NWiSS48ThI00c_Y9Zxz.JAos93qymBy6wSZnW6dc=_4db83_--

