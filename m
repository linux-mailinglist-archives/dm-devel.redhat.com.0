Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324063027
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 07:47:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68BC43082B44;
	Tue,  9 Jul 2019 05:47:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9B025C557;
	Tue,  9 Jul 2019 05:47:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D28C241F53;
	Tue,  9 Jul 2019 05:47:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68Nspga008994 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 19:54:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6994853CB; Mon,  8 Jul 2019 23:54:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7597753A7;
	Mon,  8 Jul 2019 23:54:47 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 694684075758;
	Mon,  8 Jul 2019 23:54:46 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x68NrcrV058328; Mon, 8 Jul 2019 23:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=EPFl4Sm5EvQO/ArxKFhTD4ajW8cyDBdTShPL9eEZWc0=;
	b=jkvmvoHFLAo68as3gR4la0v+Xn1MUXyMSW7VqnCwSiUjPAm7x80zQBgXeutFKK21wRhs
	qwpKR429RmmTZbqlNhFOVnwrYspaNu4qVApZHm30K+DL7Hto4sUTb4G/sKQD+ttSfWLm
	XQW9p5NG0hMSeH0rn1mB5UO6cKfB4tVJ6Ds5+lx8LzAqZLBnSx201Pr1FxtgA9nB4pwE
	9UmvXwgRD7wCphvL1Q7u8s860JK1w3Ty5hARS6HdNtbOOYzNROURpwZvP61YaAzAe6V4
	mopOV/SX4rV23Bn5e8GqmZjYeHZWNGeg9ixjU1ur1cF22JQGXpPxFhx/el4chPGDqrtp
	1A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2tjk2th7ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jul 2019 23:54:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x68Nqd0f083788; Mon, 8 Jul 2019 23:54:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2tjjykfr1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jul 2019 23:54:13 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x68NsC5J016683;
	Mon, 8 Jul 2019 23:54:12 GMT
Received: from Junxiaos-MacBook-Pro.local (/10.11.16.208)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 08 Jul 2019 16:54:12 -0700
To: Mike Snitzer <snitzer@redhat.com>
References: <20190702231456.19121-1-junxiao.bi@oracle.com>
	<20190703162106.GA13984@redhat.com>
	<1aa51708-1c1b-bd12-72ed-ecbae39043f7@oracle.com>
	<460d932b-e801-e2f8-9d0d-d3c96e1bb1ce@oracle.com>
	<20190708141427.GA8414@redhat.com>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <8a971872-ca3e-303d-02cd-cf5990bb6ab0@oracle.com>
Date: Mon, 8 Jul 2019 16:54:07 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708141427.GA8414@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9312
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907080294
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9312
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907080294
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 08 Jul 2019 23:54:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 08 Jul 2019 23:54:47 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'junxiao.bi@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.402  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_PASS,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.55.7
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 09 Jul 2019 01:47:01 -0400
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, mpatocka@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm bufio: fix deadlock issue with loop device
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 09 Jul 2019 05:47:31 +0000 (UTC)

On 7/8/19 7:14 AM, Mike Snitzer wrote:

> On Fri, Jul 05 2019 at  4:24pm -0400,
> Junxiao Bi <junxiao.bi@oracle.com> wrote:
>
>> Hi Mike,
>>
>> Do i make sense on this?
> No, you haven't made your chase for this change.  Sorry.
>
> Please refine the patch header to _not_ get into context you have from
> a vendor kernel.  I know you say this is hard to reproduce, etc.
Thanks, I will refine it in v2.
> But
> you don't even get into ther usecase where the issue was seen.  Was this
> DM thinp?  DM cache?  Something else?
it's thin-provision target. Customer is using docker.
>
> Please be as concise and precise as possible.  Saying that shrinker is
> the same context as loop doesn't imply a whole lot to me (relative to
> why this is prone to deadlock).
>
> To restate my concern: if __GFP_FS isn't set then why does your patch
> help at all?  If __GFP_FS is set, then that changes things..

If __GFP_FS isn't set, the behavior is the same with w/o this patch. If 
it is set and the mutex was already hold by others, shrinker stop, 
deadlock avoid.

Thanks,

Junxiao.

>
> Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
