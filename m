Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5D0726D49E
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 09:25:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-kQBcQ6Y7NAK5BlVSF3JQdw-1; Thu, 17 Sep 2020 03:25:50 -0400
X-MC-Unique: kQBcQ6Y7NAK5BlVSF3JQdw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B303664146;
	Thu, 17 Sep 2020 07:25:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2BA7BE44;
	Thu, 17 Sep 2020 07:25:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD2D48C7B2;
	Thu, 17 Sep 2020 07:25:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GItZbj013825 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 14:55:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12EB92144B33; Wed, 16 Sep 2020 18:55:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DAB62144B30
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 18:55:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0BB88007D9
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 18:55:31 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-GMMsdmteMg6b6LTjNDAyWQ-3; Wed, 16 Sep 2020 14:55:30 -0400
X-MC-Unique: GMMsdmteMg6b6LTjNDAyWQ-3
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GEtOQo005754; Wed, 16 Sep 2020 14:56:24 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 33gp9mbkbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 16 Sep 2020 14:56:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08GEil7j148640; Wed, 16 Sep 2020 14:56:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 33h891sjhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Sep 2020 14:56:23 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08GEuMam016574;
	Wed, 16 Sep 2020 14:56:22 GMT
Received: from [10.191.205.213] (/10.191.205.213)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 16 Sep 2020 14:56:22 +0000
To: Mike Snitzer <snitzer@redhat.com>
References: <529c2394-1b58-b9d8-d462-1f3de1b78ac8@oracle.com>
	<20200910142438.GA21919@redhat.com>
	<5261af10-bf5c-f768-dbeb-2e784a5823f9@oracle.com>
	<20200915013308.GA14877@redhat.com>
From: Vijayendra Suman <vijayendra.suman@oracle.com>
Organization: Oracle Corporation
Message-ID: <1e90b391-416e-b32d-681c-16a029e8bf54@oracle.com>
Date: Wed, 16 Sep 2020 20:26:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200915013308.GA14877@redhat.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	spamscore=0 adultscore=0
	suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009160112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	mlxlogscore=999
	adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
	phishscore=0
	spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
	mlxscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009160112
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Sep 2020 03:25:18 -0400
Cc: linux-block@vger.kernel.org,
	Somu Krishnasamy <somasundaram.krishnasamy@oracle.com>,
	dm-devel@redhat.com, RAMANAN_GOVINDARAJAN <ramanan.govindarajan@oracle.com>
Subject: Re: [dm-devel] Revert "dm: always call blk_queue_split() in
	dm_process_bio()"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Mike,

On 9/15/2020 7:03 AM, Mike Snitzer wrote:
> On Thu, Sep 10 2020 at  3:29pm -0400,
> Vijayendra Suman <vijayendra.suman@oracle.com> wrote:
>
>> Hello Mike,
>>
>> I checked with upstream, performance measurement is similar and
>> shows performance improvement when
>> 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 is reverted.
>>
>> On 9/10/2020 7:54 PM, Mike Snitzer wrote:
>>> [cc'ing dm-devel and linux-block because this is upstream concern too]
>>>
>>> On Wed, Sep 09 2020 at  1:00pm -0400,
>>> Vijayendra Suman <vijayendra.suman@oracle.com> wrote:
>>>
>>>>     Hello Mike,
>>>>
>>>>     While Running pgbench tool with  5.4.17 kernel build
>>>>
>>>>     Following performance degrade is found out
>>>>
>>>>     buffer read/write metric : -17.2%
>>>>     cache read/write metric : -18.7%
>>>>     disk read/write metric : -19%
>>>>
>>>>     buffer
>>>>     number of transactions actually processed: 840972
>>>>     latency average = 24.013 ms
>>>>     tps = 4664.153934 (including connections establishing)
>>>>     tps = 4664.421492 (excluding connections establishing)
>>>>
>>>>     cache
>>>>     number of transactions actually processed: 551345
>>>>     latency average = 36.949 ms
>>>>     tps = 3031.223905 (including connections establishing)
>>>>     tps = 3031.402581 (excluding connections establishing)
>>>>
>>>>     After revert of Commit
>>>>     2892100bc85ae446088cebe0c00ba9b194c0ac9d ( Revert "dm: always call
>>>>     blk_queue_split() in dm_process_bio()")
>>> I assume 2892100bc85ae446088cebe0c00ba9b194c0ac9d is 5.4-stable's
>>> backport of upstream commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 ?
>> Yes
>>
>>>>     Performance is Counter measurement
>>>>
>>>>     buffer ->
>>>>     number of transactions actually processed: 1135735
>>>>     latency average = 17.799 ms
>>>>     tps = 6292.586749 (including connections establishing)
>>>>     tps = 6292.875089 (excluding connections establishing)
>>>>
>>>>     cache ->
>>>>     number of transactions actually processed: 648177
>>>>     latency average = 31.217 ms
>>>>     tps = 3587.755975 (including connections establishing)
>>>>     tps = 3587.966359 (excluding connections establishing)
>>>>
>>>>     Following is your commit
>>>>
>>>>     diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>>>>     index cf71a2277d60..1e6e0c970e19 100644
>>>>     --- a/drivers/md/dm.c
>>>>     +++ b/drivers/md/dm.c
>>>>     @@ -1760,8 +1760,9 @@ static blk_qc_t dm_process_bio(struct mapped_device
>>>>     *md,
>>>>              * won't be imposed.
>>>>              */
>>>>             if (current->bio_list) {
>>>>     -               blk_queue_split(md->queue, &bio);
>>>>     -               if (!is_abnormal_io(bio))
>>>>     +               if (is_abnormal_io(bio))
>>>>     +                       blk_queue_split(md->queue, &bio);
>>>>     +               else
>>>>                             dm_queue_split(md, ti, &bio);
>>>>             }
>>>>
>>>>     Could you have a look if it is safe to revert this commit.
>>> No, it really isn't a good idea given what was documented in the commit
>>> header for commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 -- the
>>> excessive splitting is not conducive to performance either.
>>>
>>> So I think we need to identify _why_ reverting this commit is causing
>>> such a performance improvement.  Why is calling blk_queue_split() before
>>> dm_queue_split() benefiting your pgbench workload?
>> Let me know if you want to check some patch.
> Hi,
>
> Could you please test this branch?:
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.10__;!!GqivPVa7Brio!MspX41fnl1XoqlkHjwMuNFk--2a9yMSV9IQMRazyHTKEPls1nuF37bSIum7ZAOLZGxk6kw$
> (or apply at least the first 4 patches, commit 63f85d97be69^..b6a80963621fa)

With above mentioned patch set, I get following results

buffer ->

number of transactions actually processed: 1001957
latency average = 20.135 ms
tps = 5562.323947 (including connections establishing)
tps = 5562.649168 (excluding connections establishing)

cache ->

number of transactions actually processed: 581273
latency average = 34.745 ms
tps = 3223.520038 (including connections establishing)
tps = 3223.717013 (excluding connections establishing)

With above patch there is performance improvement.

> So far I've done various DM regression testing.  But I haven't tested
> with pgbench or with the misaaligned IO scenario documented in the
> header for commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74.  But I'll
> test that scenario tomorrow.
>
> Any chance you could provide some hints on how you're running pgbench
> just so I can try to test/reproduce/verify locally?
A PostgreSQL setup script will run as part of the setup within RUN to 
install the PostgreSQL DB, configure the /etc/postgresql.conf file and 
initialize the DB.
The RUN script will start the PostgreSQL service and bind it to running 
on half the cpu's, a DB will be created of a default size (I think 16M) 
and will be scaled up to the required size based on whether it is a 
buffer, cache or disk run.

After this, PostgreSQL pgbench will be run in readonly and readwrite 
modes (and be binded to the other half of the cpu's on the system).

Performance issue was seen on readwrite mode.

>
> Thanks,
> Mike
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

