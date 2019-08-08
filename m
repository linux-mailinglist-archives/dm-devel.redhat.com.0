Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C9871E7
	for <lists+dm-devel@lfdr.de>; Fri,  9 Aug 2019 07:56:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E8BC3090FC2;
	Fri,  9 Aug 2019 05:56:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8B41EC;
	Fri,  9 Aug 2019 05:56:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 688CE180BA99;
	Fri,  9 Aug 2019 05:56:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78GSd2q011390 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 12:28:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D9415D9E1; Thu,  8 Aug 2019 16:28:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C11F15D9CC;
	Thu,  8 Aug 2019 16:28:34 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1A7EC08EC00;
	Thu,  8 Aug 2019 16:28:14 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x78GNtnP183140; Thu, 8 Aug 2019 16:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type; s=corp-2019-08-05;
	bh=1I3kYX4ae/d+nnoYUsuvlLArldoH7RnWVC4uBnk7edY=;
	b=JsWSeDDX3UabtC3nz0yGZd8QlJT2noDpq6xSaYhueQLIf7zOr2T/aKdQf8BDVCFHV5Ue
	Uf7WPI+l8KzIcw6lvZBsPEiI9QZtrAh378xHbpZhp3GdZzBh6tpJ29OlzbRMy2fP1zwB
	55ORgWQLXTVKUu27QK4P2Uwq1dD5Dap3wqIfdY1paloLKOPNPdPWRMeXiTJn6lJoyxzU
	jWvi6E+/n8R97ahwd+dcUhXtgOTbTbmufZFhU+y/FONJU3zZoVVOQMYTpdAltHTWVhV5
	1ZrWCgHVaAhtGvGv2CmQ4NoIc7r34D5nrklmZV6r+N4h9v/bO6AoHmAgWVNcpEOB4QUG
	Eg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type; s=corp-2018-07-02;
	bh=1I3kYX4ae/d+nnoYUsuvlLArldoH7RnWVC4uBnk7edY=;
	b=SipSq4uRzeETkSPPck/jwwfS/4rnZaDn5gsS06abgN20Y5CsDC9i+PAyrTO6CBKHFUrr
	iNVZD2sLM5TZ37FtaUXW769s4almWD2/QK4wl1UqcfOsFUjkqn8Vaid0yWepv98TvKyl
	GqdIrw96ujtBpsNkCXPYdgxWVZQlEFcNIGzcFrZhJuozB3sog37Rk6+IaeqZvQ4gQADg
	k7bQz77juav4MDOBC7KoacUmgN4nArVICaLn7uJt5gPgh3XrjvPaM+M3B5uem4ko9CNj
	k8Ar+fGw4zvaDyujUdUeEl4zzSVTgJlSp+hoxRMVgcny4gYdxNF1V4mOtfrYYQR6v+r2
	/g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 2u8hgp2cnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2019 16:28:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x78GCeTb183340; Thu, 8 Aug 2019 16:28:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserp3030.oracle.com with ESMTP id 2u75bxv3k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Aug 2019 16:28:12 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x78GSBZU009334;
	Thu, 8 Aug 2019 16:28:11 GMT
Received: from Junxiaos-MacBook-Pro.local (/10.11.16.208)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 08 Aug 2019 09:28:11 -0700
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
References: <alpine.LRH.2.02.1908080537540.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190808144056.GA13168@redhat.com>
	<alpine.LRH.2.02.1908081056150.13377@file01.intranet.prod.int.rdu2.redhat.com>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <a3105129-b49f-be70-aa56-f0d31e40dc2e@oracle.com>
Date: Thu, 8 Aug 2019 09:28:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1908081056150.13377@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1908080152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9342
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1908080152
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Thu, 08 Aug 2019 16:28:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 08 Aug 2019 16:28:30 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'junxiao.bi@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.399  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_NONE, UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 09 Aug 2019 01:55:59 -0400
Cc: honglei.wang@oracle.com, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Revert "dm bufio: fix deadlock with loop device"
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
Content-Type: multipart/mixed; boundary="===============5391093871757617143=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 09 Aug 2019 05:56:22 +0000 (UTC)

This is a multi-part message in MIME format.
--===============5391093871757617143==
Content-Type: multipart/alternative;
	boundary="------------041B2AD86BFBC9AA6619D466"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------041B2AD86BFBC9AA6619D466
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/8/19 8:01 AM, Mikulas Patocka wrote:

>>> Note that the patch bd293d071ffe doesn't really prevent the deadlock from
>>> occuring - if we look at the stacktrace reported by Junxiao Bi, we see
>>> that it hangs in bit_wait_io and not on the mutex - i.e. it has already
>>> successfully taken the mutex. Changing the mutex from mutex_lock to
>>> mutex_trylock won't help with deadlocks that happen afterwards.
>>>
>>> PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
>>>     #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
>>>     #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
>>>     #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
>>>     #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
>>>     #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
>>>     #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
>>>     #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
>>>     #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
>>>     #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
>>>     #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
>>>    #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
>>>    #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
>>>    #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
>>>    #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
>>>    #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
>> The above stack trace doesn't tell the entire story though.  Yes, one
>> process will have already gotten the the lock and is left waiting on
>> IO.  But that IO isn't able to complete because it is blocked on mm's
>> reclaim also trying to evict via same shrinker... so another thread will
>> be blocked waiting on the mutex (e.g. PID 14127 in your recent patch
>> header).
>>
>> Please re-read the header for commit bd293d071ffe -- I think that fix is
>> good.  But, I could still be wrong...;)
> The problem with the "dm_bufio_trylock" patch is - suppose that we are
> called with GFP_KERNEL context - we succeed with dm_bufio_trylock and then
> go to __make_buffer_clean->out_of_line_wait_on_bit->__wait_on_bit - if
> this wait depends no some I/O completion on the loop device, we still get
> a deadlock.

No, this is not right, see the source code in __try_evict_buffer(). It 
will never wait io in GFP_KERENL case.

1546     if (!(gfp & __GFP_FS)) {
1547         if (test_bit(B_READING, &b->state) ||
1548             test_bit(B_WRITING, &b->state) ||
1549             test_bit(B_DIRTY, &b->state))
1550             return false;
1551     }

Thanks,

Junxiao.

>
> The patch fixes some case of the deadlock, but it doesn't fix it entirely.
>
> Mikulas
>

--------------041B2AD86BFBC9AA6619D466
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 8/8/19 8:01 AM, Mikulas Patocka wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:alpine.LRH.2.02.1908081056150.13377@file01.intranet.prod.int.rdu2.redhat.com">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">Note that the patch bd293d071ffe doesn't really prevent the deadlock from
occuring - if we look at the stacktrace reported by Junxiao Bi, we see
that it hangs in bit_wait_io and not on the mutex - i.e. it has already
successfully taken the mutex. Changing the mutex from mutex_lock to
mutex_trylock won't help with deadlocks that happen afterwards.

PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
   #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
   #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
   #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
   #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
   #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
   #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
   #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
   #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
   #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
   #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
  #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
  #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
  #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
  #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
  #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The above stack trace doesn't tell the entire story though.  Yes, one
process will have already gotten the the lock and is left waiting on
IO.  But that IO isn't able to complete because it is blocked on mm's
reclaim also trying to evict via same shrinker... so another thread will
be blocked waiting on the mutex (e.g. PID 14127 in your recent patch
header).

Please re-read the header for commit bd293d071ffe -- I think that fix is
good.  But, I could still be wrong... <span class="moz-smiley-s3" title=";)"><span>;)</span></span>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">The problem with the "dm_bufio_trylock" patch is - suppose that we are 
called with GFP_KERNEL context - we succeed with dm_bufio_trylock and then 
go to __make_buffer_clean-&gt;out_of_line_wait_on_bit-&gt;__wait_on_bit - if 
this wait depends no some I/O completion on the loop device, we still get 
a deadlock.</pre>
    </blockquote>
    <p>No, this is not right, see the source code in
      __try_evict_buffer(). It will never wait io in GFP_KERENL case.<br>
    </p>
    <p>1546     if (!(gfp &amp; __GFP_FS)) {<br>
      1547         if (test_bit(B_READING, &amp;b-&gt;state) ||<br>
      1548             test_bit(B_WRITING, &amp;b-&gt;state) ||<br>
      1549             test_bit(B_DIRTY, &amp;b-&gt;state))<br>
      1550             return false;<br>
      1551     }<br>
    </p>
    <p>Thanks,</p>
    <p>Junxiao.<br>
    </p>
    <blockquote type="cite"
cite="mid:alpine.LRH.2.02.1908081056150.13377@file01.intranet.prod.int.rdu2.redhat.com">
      <pre class="moz-quote-pre" wrap="">

The patch fixes some case of the deadlock, but it doesn't fix it entirely.

Mikulas

</pre>
    </blockquote>
  </body>
</html>

--------------041B2AD86BFBC9AA6619D466--


--===============5391093871757617143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5391093871757617143==--

