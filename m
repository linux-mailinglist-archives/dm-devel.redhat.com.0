Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2523214A0E9
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jan 2020 10:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580117673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3a1bVnGtU347hlpY9NutyjrI8nAjsusZhQrujNmHFOA=;
	b=Kk3ZasptbQQXC4EoiAMFG14h+kE9FWWHPP+GiDM9ZL47DD9Ie7h9pif3hxgXMMl6nK676V
	0GUMrio49uv4g5dpP0JRngq2Qnl8qOZVJp9QWvPLgsd+On2Q6XgTfCQSC3+SQu6xv0XfLK
	D1+D7DPbqHuSHVHJeqIkuzhFXz8Qo1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-JtXtzcbBMVGr1dZZge3NjA-1; Mon, 27 Jan 2020 04:34:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E142E8010C5;
	Mon, 27 Jan 2020 09:34:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B955D5E241;
	Mon, 27 Jan 2020 09:34:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D83A81969;
	Mon, 27 Jan 2020 09:34:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P2cWsb014642 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 21:38:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E939D2026D67; Sat, 25 Jan 2020 02:38:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E38832037E42
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:38:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D96785A302
	for <dm-devel@redhat.com>; Sat, 25 Jan 2020 02:38:29 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-EQGnG3gpNIesM1DX4oxP5Q-1; Fri, 24 Jan 2020 21:38:27 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	00P2Y8PA022556; Sat, 25 Jan 2020 02:38:12 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2xktnrv593-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2020 02:38:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	00P2YF9A110642; Sat, 25 Jan 2020 02:38:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2xrd0rr2bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jan 2020 02:38:12 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00P2c4cC021548;
	Sat, 25 Jan 2020 02:38:05 GMT
Received: from [192.168.0.110] (/39.176.206.183)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 24 Jan 2020 18:38:04 -0800
To: Kirill Tkhai <ktkhai@virtuozzo.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
	axboe@kernel.dk, agk@redhat.com, snitzer@redhat.com,
	dm-devel@redhat.com, song@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, Chaitanya.Kulkarni@wdc.com,
	darrick.wong@oracle.com, ming.lei@redhat.com, osandov@fb.com,
	jthumshirn@suse.de, minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	bvanassche@acm.org, dhowells@redhat.com, asml.silence@gmail.com
References: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
	<157969068296.174869.13461609442947913096.stgit@localhost.localdomain>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <8b77117b-1cc0-a379-2cdf-554a8060206c@oracle.com>
Date: Sat, 25 Jan 2020 10:37:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <157969068296.174869.13461609442947913096.stgit@localhost.localdomain>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-2001250021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9510
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-2001250021
X-MC-Unique: EQGnG3gpNIesM1DX4oxP5Q-1
X-MC-Unique: JtXtzcbBMVGr1dZZge3NjA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Jan 2020 04:34:01 -0500
Subject: Re: [dm-devel] [PATCH v5 2/6] block: Pass op_flags into
 blk_queue_get_max_sectors()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/22/20 6:58 PM, Kirill Tkhai wrote:
> This preparation patch changes argument type, and now
> the function takes full op_flags instead of just op code.
> 
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>  block/blk-core.c       |    4 ++--
>  include/linux/blkdev.h |    8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 50a5de025d5e..ac2634bcda1f 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1250,10 +1250,10 @@ EXPORT_SYMBOL(submit_bio);
>  static int blk_cloned_rq_check_limits(struct request_queue *q,
>  				      struct request *rq)
>  {
> -	if (blk_rq_sectors(rq) > blk_queue_get_max_sectors(q, req_op(rq))) {
> +	if (blk_rq_sectors(rq) > blk_queue_get_max_sectors(q, rq->cmd_flags)) {
>  		printk(KERN_ERR "%s: over max size limit. (%u > %u)\n",
>  			__func__, blk_rq_sectors(rq),
> -			blk_queue_get_max_sectors(q, req_op(rq)));
> +			blk_queue_get_max_sectors(q, rq->cmd_flags));
>  		return -EIO;
>  	}
>  
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 0f1127d0b043..23a5850f35f6 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -989,8 +989,10 @@ static inline struct bio_vec req_bvec(struct request *rq)
>  }
>  
>  static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
> -						     int op)
> +						     unsigned int op_flags)
>  {
> +	int op = op_flags & REQ_OP_MASK;
> +

Nitpick. int op = req_op(rq);

Anyway, looks good to me.
Reviewed-by: Bob Liu <bob.liu@oracle.com>

>  	if (unlikely(op == REQ_OP_DISCARD || op == REQ_OP_SECURE_ERASE))
>  		return min(q->limits.max_discard_sectors,
>  			   UINT_MAX >> SECTOR_SHIFT);
> @@ -1029,10 +1031,10 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>  	if (!q->limits.chunk_sectors ||
>  	    req_op(rq) == REQ_OP_DISCARD ||
>  	    req_op(rq) == REQ_OP_SECURE_ERASE)
> -		return blk_queue_get_max_sectors(q, req_op(rq));
> +		return blk_queue_get_max_sectors(q, rq->cmd_flags);
>  
>  	return min(blk_max_size_offset(q, offset),
> -			blk_queue_get_max_sectors(q, req_op(rq)));
> +			blk_queue_get_max_sectors(q, rq->cmd_flags));
>  }
>  
>  static inline unsigned int blk_rq_count_bios(struct request *rq)
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

